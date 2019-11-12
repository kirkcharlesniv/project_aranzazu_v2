import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  final http.Client httpClient;
  MapsBloc({@required this.httpClient});

  @override
  MapsState get initialState => MapsUninitialized();

  @override
  Stream<MapsState> mapEventToState(
    MapsEvent event,
  ) async* {
    if (event is FetchMapsMarkers) {
      try {
        yield MapsLoading();
        final mapsSet = await _fetchMapsMarkers();
        yield MapsLoaded(mapsSet: mapsSet);
      } catch (_, __) {
        // TODO: Implement Data Connection Checker
        print(_);
        print(__);
        yield MapsError();
      }
    }
  }

  Future<Set<Marker>> _fetchMapsMarkers() async {
    final response = await httpClient.get('https://api.myjson.com/bins/8ro82');

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      try {
        return data.map(
          (rawMarker) {
            return Marker(
              markerId: MarkerId(rawMarker['msk']),
              position: LatLng(double.parse(rawMarker['lat']),
                  double.parse(rawMarker['long'])),
              infoWindow: InfoWindow(title: rawMarker['msk']),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueAzure),
            );
          },
        ).toSet();
      } catch (_) {
        print(_);
        throw Exception();
      }
    } else {
      throw Exception();
    }
  }
}
