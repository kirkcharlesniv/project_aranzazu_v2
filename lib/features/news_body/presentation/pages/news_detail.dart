import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:project_aranzazu_v2/features/news/model/built_news.dart';
import 'package:http/http.dart' as http;
import 'package:project_aranzazu_v2/features/news_body/presentation/bloc/bloc.dart';
import 'package:project_aranzazu_v2/features/news_body/presentation/widgets/detail_app_bar.dart';
import 'package:project_aranzazu_v2/features/news_body/presentation/widgets/detail_information.dart';
import 'package:project_aranzazu_v2/features/widgets/blocs/imports.dart';

class NewsDetailPage extends StatelessWidget {
  final BuiltNews news;

  const NewsDetailPage({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        builder: (context) => NewsBodyBloc(httpClient: http.Client())
          ..add(FetchNewsBody(news.id)),
        child: NewsDetailItem(
          news: news,
        ));
  }
}

class NewsDetailItem extends StatefulWidget {
  final BuiltNews news;
  const NewsDetailItem({Key key, @required this.news}) : super(key: key);

  @override
  _NewsDetailItemState createState() => _NewsDetailItemState();
}

class _NewsDetailItemState extends State<NewsDetailItem> {
  NewsBodyBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NewsBodyBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          DetailAppBar(
            news: widget.news,
          ),
          DetailInformation(
            news: widget.news,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 11, right: 11),
              child: Container(
                child: BlocBuilder<NewsBodyBloc, NewsBodyState>(
                  builder: (context, state) {
                    final currentState = state;
                    if (currentState is NewsBodyUninitialized) {
                      return UninitializedBlocWidget();
                    }
                    if (currentState is NewsBodyError) {
                      return ErrorBlocWidget();
                    }
                    if (currentState is NewsBodyLoaded) {
                      if (currentState.body.toString().isEmpty) {
                        return EmptyBlocWidget();
                      }
                      return HtmlWidget(
                        currentState.body.item,
                        webView: true,
                        textStyle: TextStyle(color: Colors.black, height: 1.2),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
