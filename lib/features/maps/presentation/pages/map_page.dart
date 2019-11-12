import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_aranzazu_v2/features/events/presentation/bloc/bloc.dart';
import 'package:project_aranzazu_v2/features/maps/presentation/bloc/bloc.dart';
import 'package:project_aranzazu_v2/features/widgets/blocs/imports.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapsBloc _bloc;
  double currentPageValue = 0.0;
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<MapsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapsBloc, MapsState>(
        builder: (context, state) {
          final currentState = state;
          if (currentState is MapsUninitialized) {
            return UninitializedBlocWidget();
          }
          if (currentState is MapsError) {
            return ErrorBlocWidget();
          }

          if (currentState is MapsLoaded) {
            if (currentState.mapsSet.isEmpty) {
              return EmptyBlocWidget();
            }

            final markersAsList = List.from(currentState.mapsSet);

            PageController _pageController =
                PageController(initialPage: 0, viewportFraction: 0.8);
            _pageController.addListener(() {
              setState(() {
                currentPageValue = _pageController.page;
              });
            });

            return Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: GestureDetector(
                    child: GoogleMap(
                      mapType: MapType.normal,
                      zoomGesturesEnabled: true,
                      minMaxZoomPreference: MinMaxZoomPreference(13, 18),
                      initialCameraPosition: CameraPosition(
                          target: LatLng(14.6953613, 121.1167872), zoom: 16.25),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: currentState.mapsSet,
                    ),
                  ),
                ),
                // TODO: Make Cards
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long, double zoom) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 15)));
  }
}
