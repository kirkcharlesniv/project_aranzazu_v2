import 'package:equatable/equatable.dart';
import 'package:project_aranzazu_v2/features/events/model/built_events.dart';

abstract class EventsState extends Equatable {
  const EventsState();
}

class EventsUninitialized extends EventsState {
  @override
  List<Object> get props => [];
}

class EventsError extends EventsState {
  @override
  List<Object> get props => [];
}

class EventsLoading extends EventsState {
  @override
  List<Object> get props => [];
}

class EventsLoaded extends EventsState {
  final List<BuiltEvents> eventsList;
  EventsLoaded({this.eventsList});

  @override
  List<Object> get props => [eventsList];
}
