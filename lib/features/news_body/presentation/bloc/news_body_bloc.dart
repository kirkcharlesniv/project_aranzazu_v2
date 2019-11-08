import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:project_aranzazu_v2/features/news_body/model/built_news_body.dart';
import './bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class NewsBodyBloc extends Bloc<NewsBodyEvent, NewsBodyState> {
  final http.Client httpClient;
  NewsBodyBloc({@required this.httpClient});

  @override
  NewsBodyState get initialState => NewsBodyUninitialized();

  @override
  Stream<NewsBodyState> mapEventToState(
    NewsBodyEvent event,
  ) async* {
    final currentState = state;

    if (event is FetchNewsBody) {
      try {
        if (currentState is NewsBodyUninitialized) {
          final newsBody = await _fetchNewsBody(event.id);
          yield NewsBodyLoaded(newsBody);
        }
      } catch (_) {
        yield NewsBodyError();
      }
    }
  }

  Future<BuiltNewsBody> _fetchNewsBody(int id) async {
    final response = await http.get(
        "http://aranzazushrine.ph/home/index.php/wp-json/capie/v1/fetch/article?id=" +
            id.toString());
    if (response.statusCode == 200) {
      return BuiltNewsBody.fromJson(response.body);
    } else {
      throw Exception();
    }
  }
}
