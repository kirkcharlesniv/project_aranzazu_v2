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
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Hero(
                    tag: "${marker.imageUrl}.${marker.msk}",
                    child: Image.network(
                      marker.imageUrl ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSK8ga7PfZkMSPXBd5SZC8o1fG713PWlH-irdaV0wi1bOcaGUXj",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      marker.msk,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      marker.location,
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
