import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:project_aranzazu_v2/features/maps/models/built_markers.dart';
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
        final response =
            await httpClient.get('https://api.myjson.com/bins/1bn5h2');

        if (response.statusCode == 200) {
          final mapsSet = await _fetchMapsMarkers(response);
          final mapsList = await _fetchMapsList(response);
          yield MapsLoaded(mapsSet: mapsSet, mapsList: mapsList);
        } else {
          throw Exception();
        }
      } catch (_, __) {
        loadData() async* {
          yield MapsUninitialized();
          yield MapsLoading();
          final response =
              await httpClient.get('https://api.myjson.com/bins/1bn5h2');

          if (response.statusCode == 200) {
            final mapsSet = await _fetchMapsMarkers(response);
            final mapsList = await _fetchMapsList(response);
            yield MapsLoaded(mapsSet: mapsSet, mapsList: mapsList);
          } else {
            throw Exception();
          }
        }

        returnError() async* {
          yield MapsError();
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

  Future<Set<Marker>> _fetchMapsMarkers(Response response) async {
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
  }

  Future<List<BuiltMarkers>> _fetchMapsList(Response response) async {
    final mapsList = json.decode(response.body) as List;
    try {
      return mapsList.map((rawPost) {
        rawPost['lat'] = double.parse(rawPost['lat']);
        rawPost['long'] = double.parse(rawPost['long']);
        rawPost['zoom'] = double.parse(rawPost['zoom']);
        return BuiltMarkers.fromJson(json.encode(rawPost));
      }).toList();
    } catch (_) {
      print(_);
      throw Exception();
    }
  }
}
