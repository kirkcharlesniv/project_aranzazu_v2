import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:project_aranzazu_v2/core/consts.dart';
import 'package:project_aranzazu_v2/features/news/model/built_news.dart';
import 'package:rxdart/rxdart.dart';
import './bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final http.Client httpClient;
  NewsBloc({@required this.httpClient});
  int index = 1;
  @override
  NewsState get initialState => NewsUnintialized();

  @override
  Stream<NewsState> transformEvents(Stream<NewsEvent> events,
      Stream<NewsState> Function(NewsEvent event) next) {
    return super.transformEvents(
        (events as Observable<NewsEvent>).debounceTime(Duration(seconds: 1)),
        next);
  }

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    final currentState = state;

    if (event is FetchNews && !_hasReachedMax(currentState)) {
      try {
        if (currentState is NewsUnintialized) {
          final newsList = await _fetchNews(index);
          print('fetches from news uninit');
          yield NewsLoaded(newsList: newsList, hasReachedMax: false);
        }
        if (currentState is NewsLoaded) {
          ++index;

          final newsList = await _fetchNews(index);
          print('fetches from news loaded');
          yield newsList.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : NewsLoaded(
                  newsList: currentState.newsList + newsList,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        const Duration DEFAULT_INTERVAL = const Duration(seconds: 1);
        Duration checkInterval = DEFAULT_INTERVAL;

        loadData() async* {
          print('reloads data');
          yield NewsUnintialized();
          final newsList = await _fetchNews(index);
          yield NewsLoaded(newsList: newsList, hasReachedMax: false);
        }

        returnError() async* {
          yield NewsError();
        }

        DataConnectionChecker().onStatusChange.listen((status) {
          switch (status) {
            case DataConnectionStatus.connected:
              print('Data connection is available.');
              loadData();
              break;
            case DataConnectionStatus.disconnected:
              print('You are disconnected from the internet.');
              returnError();
              break;
          }
        });
      }
    }

    samplefunc() {}
  }

  bool _hasReachedMax(NewsState state) =>
      state is NewsLoaded && state.hasReachedMax;

  Future<List<BuiltNews>> _fetchNews(int index) async {
    print('fetch from index $index');
    final response = await httpClient.get(
        'http://aranzazushrine.ph/home/index.php/wp-json/capie/v1/news?page=$index');

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      try {
        return data.map((rawPost) {
          if (rawPost['thumbnail'] == false)
            rawPost['thumbnail'] = THUMBNAIL_DEFAULT;
          return BuiltNews.fromJson(json.encode(rawPost));
        }).toList();
      } catch (_) {
        throw Exception();
      }
    } else {
      final failedData = json.decode(response.body);
      throw Exception(failedData['message']);
    }
  }
}
