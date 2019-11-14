import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  final Set<Marker> markers;
  final Completer<GoogleMapController> controller;

  const GoogleMapWidget(
      {Key key, @required this.markers, @required this.controller})
      : super(key: key);

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            widget.controller.complete(controller);
          },
          markers: widget.markers,
        ),
      ),
    );
  }
}
