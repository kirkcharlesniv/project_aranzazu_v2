import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/maps/models/built_markers.dart';
import 'package:project_aranzazu_v2/features/maps/presentation/pages/marker_detail.dart';

class GoogleMapCard extends StatelessWidget {
  final BuiltMarkers marker;
  final bool active;
  const GoogleMapCard({Key key, @required this.marker, @required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double top = active ? 2 : 20;

    return GestureDetector(
      onTap: () {
        if (active) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MarkerDetail(
                marker: marker,
              ),
            ),
          );
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.only(right: 15, bottom: 12.5, top: top),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                marker.msk,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                marker.location,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
