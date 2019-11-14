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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                marker.msk,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
              background: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSK8ga7PfZkMSPXBd5SZC8o1fG713PWlH-irdaV0wi1bOcaGUXj",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Placeholder(),
          )
        ],
      ),
    );
  }
}
