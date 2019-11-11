import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_aranzazu_v2/core/check_internet_widget.dart';
import 'package:project_aranzazu_v2/features/news/presentation/bloc/bloc.dart';
import 'package:project_aranzazu_v2/features/widgets/blocs/imports.dart';

import 'custom_circular_progress_indicator.dart';
import 'news_list_item.dart';

class NewsScrollPage extends StatefulWidget {
  @override
  _NewsScrollPageState createState() => _NewsScrollPageState();
}

class _NewsScrollPageState extends State<NewsScrollPage> {
  final ScrollController _scrollController = ScrollController();
  final double _scrollThreshold = 200.0;
  NewsBloc _bloc;

  bool shouldResetFeed;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _bloc.add(FetchNews());
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _bloc = BlocProvider.of<NewsBloc>(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetWidget(
      widget: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          final currentState = state;
          if (currentState is NewsUnintialized) {
            return UninitializedBlocWidget();
          }
          if (currentState is NewsError) {
            if (shouldResetFeed ?? false) {
              _bloc.add(FetchNews());
            }
            return ErrorBlocWidget();
          }
          if (currentState is NewsLoaded) {
            if (currentState.newsList.isEmpty) {
              return EmptyBlocWidget();
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= currentState.newsList.length
                    ? CustomCircularProgressIndicator()
                    : NewsListItem(news: currentState.newsList[index]);
              },
              itemCount: currentState.hasReachedMax
                  ? currentState.newsList.length
                  : currentState.newsList.length + 1,
              controller: _scrollController,
            );
          }
          return Container();
        },
      ),
      func: () {
        _bloc.add(FetchNews());
      },
    );
  }
}
