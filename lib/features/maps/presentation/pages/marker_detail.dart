import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/maps/models/built_markers.dart';

class MarkerDetail extends StatelessWidget {
  final BuiltMarkers marker;

  const MarkerDetail({Key key, this.marker}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSK8ga7PfZkMSPXBd5SZC8o1fG713PWlH-irdaV0wi1bOcaGUXj'),
                        fit: BoxFit.cover),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.75, sigmaY: 0.75),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
                SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Hero(
                              tag: marker.msk,
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  marker.msk,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Hero(
                              tag: marker.location,
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  marker.location,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 6,
            child: Placeholder(),
          )
        ],
      ),
    );
  }
}
