import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:project_aranzazu_v2/features/events/model/built_events.dart';
import './bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final http.Client httpClient;
  EventsBloc({@required this.httpClient});
  final DateTime now = DateTime.now();

  @override
  EventsState get initialState => EventsUninitialized();

  @override
  Stream<EventsState> mapEventToState(
    EventsEvent event,
  ) async* {
    if (event is FetchEvents) {
      try {
        yield EventsLoading();
        final events = await _fetchEvents();
        yield EventsLoaded(eventsList: filterEvents(events));
      } catch (_, __) {
        loadData() async* {
          yield EventsUninitialized();
          yield EventsLoading();
          final events = await _fetchEvents();

          yield EventsLoaded(eventsList: filterEvents(events));
        }

        returnError() async* {
          yield EventsError();
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

  List<BuiltEvents> filterEvents(List<BuiltEvents> events) {
    return events
        .where((data) => DateTime.parse(Jiffy(data.date, 'MMMM dd, y').format())
            .isAfter(now))
        .toList();
  }

  Future<List<BuiltEvents>> _fetchEvents() async {
    final response = await httpClient.get('https://api.myjson.com/bins/108s5w');

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      try {
        return data.map((rawPost) {
          return BuiltEvents.fromJson(json.encode(rawPost));
        }).toList();
      } catch (_) {
        throw Exception();
      }
    } else {
      throw Exception();
    }
  }
}
