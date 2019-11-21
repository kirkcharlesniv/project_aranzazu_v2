import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:project_aranzazu_v2/features/events/model/built_events.dart';
import './bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final http.Client httpClient;
  String formatted;

  DateTime now = DateTime.now();

  EventsBloc({@required this.httpClient});

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

        now = DateTime.now();

        List<BuiltEvents> filteredEvents = events
            .where((data) =>
                DateTime.parse(Jiffy(data.date, 'MMMM dd, y').format())
                    .isAfter(now))
            .toList();

        yield EventsLoaded(eventsList: filteredEvents);
      } catch (_, __) {
        yield EventsError();
      }
    }
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
