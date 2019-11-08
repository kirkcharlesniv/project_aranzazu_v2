import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_aranzazu_v2/features/news/presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:project_aranzazu_v2/features/news_search/presentation/bloc/bloc.dart';
import 'package:project_aranzazu_v2/features/news_search/presentation/widgets/search_list_item.dart';
import 'package:project_aranzazu_v2/features/widgets/blocs/imports.dart';

class NewsSearch extends SearchDelegate<String> {
  final SearchBloc _bloc;
  NewsSearch(this._bloc);

  final ScrollController _scrollController = ScrollController();
  final double _scrollThreshold = 200.0;
  final recentSearches = [];
  final searches = [];

  String lastQuery;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _bloc.add(FetchSearch(query: query));
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
          _bloc.add(ResetSearch());
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          _bloc.add(ResetSearch());
          close(context, null);
        });
  }

  @override
  void showResults(BuildContext context) {
    bool shouldReset = false;

    if (lastQuery != query) {
      shouldReset = true;
      _bloc.add(ResetSearch());
      _bloc.add(FetchSearch(query: query, shouldResetSearch: shouldReset));
    }

    _bloc.add(FetchSearch(query: query, shouldResetSearch: shouldReset));
    lastQuery = query;
    super.showResults(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    _scrollController.addListener(_onScroll);

    return BlocBuilder<SearchBloc, SearchState>(
      bloc: _bloc,
      builder: (BuildContext context, SearchState state) {
        final currentState = state;
        if (currentState is SearchUninitialized) {
          // TODO: Add a better error widget
          return Container();
        }
        if (currentState is SearchLoading) {
          return UninitializedBlocWidget();
        }

        if (currentState is SearchError) {
          return ErrorBlocWidget();
        }

        if (currentState is SearchLoaded) {
          if (currentState.newsList.isEmpty) {
            return EmptyBlocWidget();
          }
          return ListView.builder(
            key: new PageStorageKey('myListView'),
            itemBuilder: (BuildContext context, int index) {
              return index >= currentState.newsList.length
                  ? CustomCircularProgressIndicator()
                  : SearchListItem(currentState.newsList[index]);
            },
            itemCount: currentState.hasReachedMax
                ? currentState.newsList.length
                : currentState.newsList.length + 1,
            controller: _scrollController,
          );
        }
        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSearches
        : searches.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.search),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
