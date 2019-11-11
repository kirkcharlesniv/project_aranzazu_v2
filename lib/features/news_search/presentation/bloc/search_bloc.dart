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

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final http.Client httpClient;
  SearchBloc({@required this.httpClient});
  int index = 1;
  @override
  SearchState get initialState => SearchUninitialized();

  @override
  Stream<SearchState> transformEvents(Stream<SearchEvent> events,
      Stream<SearchState> Function(SearchEvent event) next) {
    return super.transformEvents(
        (events as Observable<SearchEvent>).debounceTime(
          Duration(seconds: 1),
        ),
        next);
  }

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    final currentState = state;
    if (event is FetchSearch && !_hasReachedMax(currentState)) {
      if (event.shouldResetSearch ?? false) {
        yield SearchUninitialized();
      }
      try {
        if (currentState is SearchUninitialized) {
          if (event is ResetSearch) {
            yield SearchUninitialized();
          }
          yield SearchLoading();
          final newsList = await _fetchSearchNews(index, event.query);
          yield SearchLoaded(newsList: newsList, hasReachedMax: false);
        }
        if (currentState is SearchLoaded) {
          ++index;
          // I think we should make a check here, if isResetSearch is true, then clear the newsList.
          final newsList = await _fetchSearchNews(index, event.query);
          if (event.shouldResetSearch ?? false) {
            yield SearchUninitialized();
          }
          yield newsList.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : SearchLoaded(
                  newsList: (event.shouldResetSearch ?? false)
                      ? newsList
                      : currentState.newsList + newsList,
                  hasReachedMax: false,
                );
        }
      } catch (_, __) {
        loadData() async* {
          yield SearchUninitialized();
          final newsList = await _fetchSearchNews(index, event.query);
          yield SearchLoaded(newsList: newsList, hasReachedMax: false);
        }

        returnError() async* {
          yield SearchError();
        }

        DataConnectionChecker().onStatusChange.listen((status) {
          switch (status) {
            case DataConnectionStatus.connected:
              loadData();
              break;
            case DataConnectionStatus.disconnected:
              returnError();
              break;
          }
        });
      }
    }
  }

  bool _hasReachedMax(SearchState state) =>
      state is SearchLoaded && state.hasReachedMax;

  Future<List<BuiltNews>> _fetchSearchNews(int index, String query) async {
    final response = await httpClient.get(
        'http://aranzazushrine.ph/home/index.php/wp-json/capie/v1/search/news?page=$index&s=$query');

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
