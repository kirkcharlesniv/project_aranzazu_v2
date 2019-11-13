import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_aranzazu_v2/features/maps/models/built_markers.dart';

abstract class MapsState extends Equatable {
  const MapsState();
}

class MapsUninitialized extends MapsState {
  @override
  List<Object> get props => [];
}

class MapsError extends MapsState {
  @override
  List<Object> get props => [];
}

class MapsLoading extends MapsState {
  @override
  List<Object> get props => [];
}

class MapsLoaded extends MapsState {
  final Set<Marker> mapsSet;
  final List<BuiltMarkers> mapsList;

  MapsLoaded({this.mapsSet, this.mapsList});

  @override
  List<Object> get props => [mapsSet];
}
