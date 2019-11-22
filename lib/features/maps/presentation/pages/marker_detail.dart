import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/maps/models/built_markers.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkerDetail extends StatelessWidget {
  final BuiltMarkers marker;
  const MarkerDetail({Key key, this.marker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
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
              background: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.darken,
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Hero(
                      tag: "${marker.imageUrl}.${marker.msk}",
                      child: Image.network(
                        marker.imageUrl ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSK8ga7PfZkMSPXBd5SZC8o1fG713PWlH-irdaV0wi1bOcaGUXj',
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    marker.msk,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    marker.description ?? '',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff8E8E8E),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton.icon(
                        icon: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (rect) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffF58524), Color(0xffF92B7F)],
                            ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height));
                          },
                          child: Icon(
                            Icons.location_city,
                            size: 18,
                            color: Color(0xffF83079),
                          ),
                        ),
                        label: Text(
                          'Directions',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffF83079),
                              decoration: TextDecoration.underline),
                        ),
                        onPressed: () async {
                          final url =
                              "https://www.google.com/maps/dir/?api=1&destination=${marker.lat},${marker.long}";

                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                      ),
                      FlatButton.icon(
                        icon: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (rect) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffF58524), Color(0xffF92B7F)],
                            ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height));
                          },
                          child: Icon(
                            Icons.phone_android,
                            size: 18,
                            color: Color(0xffF83079),
                          ),
                        ),
                        label: Text(
                          'Contact',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffF83079),
                              decoration: TextDecoration.underline),
                        ),
                        onPressed: () async {
                          final url =
                              "https://www.messenger.com/t/387856777939906";

                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                      ),
                    ],
                  ),
                  Text(
                    'Mass Schedules',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: marker.weekly_schedules.map((b) {
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 5),
                        height: MediaQuery.of(context).size.height * 0.0375,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Text(
                                  b.title,
                                  style: TextStyle(
                                      color: Color(0xff8E8E8E),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ListView.builder(
                                itemCount: b.hour_schedules.length,
                                itemBuilder: (context, index) {
                                  int hour = b.hour_schedules[index].hour;
                                  int noon_fix = 1;
                                  String time = "AM";

                                  if (hour == 12) {
                                    time = "NN";
                                  } else if (hour > 12) {
                                    hour -= 12;
                                    time = "PM";
                                  }

                                  return Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(6),
                                      padding: EdgeInsets.all(4.5),
                                      color: Color(0xff8E8E8E),
                                      child: Text(
                                        "$hour:${b.hour_schedules[index].minute ?? "00"} $time — ${(hour == 12) ? 1 : hour + 1}:${b.hour_schedules[index].minute ?? "00"} $time",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff8E8E8E),
                                            fontSize: 11.5),
                                      ),
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
