import 'package:equatable/equatable.dart';

abstract class MapsEvent extends Equatable {
  const MapsEvent();
}

class FetchMapsMarkers extends MapsEvent {
  const FetchMapsMarkers();

  @override
  List<Object> get props => [];
}
