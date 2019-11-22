import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_aranzazu_v2/features/maps/models/built_markers.dart';

import 'google_map_card.dart';

class GoogleMapsPageView extends StatefulWidget {
  final List<BuiltMarkers> mapsList;
  final Completer<GoogleMapController> controller;
  const GoogleMapsPageView(
      {Key key, @required this.mapsList, @required this.controller})
      : super(key: key);

  @override
  _GoogleMapsPageViewState createState() => _GoogleMapsPageViewState();
}

class _GoogleMapsPageViewState extends State<GoogleMapsPageView> {
  double currentPageValue = 0.0;
  PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.725);
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        child: PageView.builder(
          itemCount: widget.mapsList.length,
          controller: _pageController,
          onPageChanged: (page) async {
            _gotoLocation(widget.mapsList[page].lat, widget.mapsList[page].long,
                widget.mapsList[page].zoom);
          },
          itemBuilder: (context, index) {
            bool _active = index == currentPageValue.round();

            return GoogleMapCard(
              marker: widget.mapsList[index],
              active: _active,
            );
          },
        ),
        height: MediaQuery.of(context).size.height * 0.325,
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long, double zoom) async {
    final GoogleMapController controller = await widget.controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: zoom)));
  }
}
