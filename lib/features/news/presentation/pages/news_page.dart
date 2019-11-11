import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_aranzazu_v2/features/news/presentation/widgets/news_scroll_page.dart';
import 'package:project_aranzazu_v2/features/news_search/presentation/bloc/bloc.dart';
import 'package:project_aranzazu_v2/features/news_search/presentation/widgets/news_search.dart';
import 'package:project_aranzazu_v2/features/widgets/app_bar_title.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {
            showSearch(
                context: context,
                delegate: NewsSearch(BlocProvider.of<SearchBloc>(context)));
          },
        ),
        title: AppBarTitle('News'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.black),
          )
        ],
      ),
      body: NewsScrollPage(),
    );
  }
}
