import 'package:equatable/equatable.dart';

abstract class EventsEvent extends Equatable {
  const EventsEvent();
}

class FetchEvents extends EventsEvent {
  @override
  List<Object> get props => [];
}
