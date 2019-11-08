import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/events/model/built_events.dart';
import 'package:project_aranzazu_v2/features/events/presentation/widgets/event_detail_app_bar.dart';
import 'package:project_aranzazu_v2/features/events/presentation/widgets/event_detail_buttons.dart';

class EventDetail extends StatefulWidget {
  final BuiltEvents event;
  const EventDetail({Key key, this.event}) : super(key: key);

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: "${widget.event.event}.${widget.event.image}",
            child: Container(
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ],
                  ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height + 10));
                },
                blendMode: BlendMode.darken,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network(
                    widget.event.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    EventDetailAppBar(
                      event: widget.event,
                    ),
                    EventDetailButtons(
                      key: Key(widget.event.event),
                    ),
                    Text(
                      widget.event.description,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
