import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/events/model/built_events.dart';

class EventDetailAppBar extends StatelessWidget {
  final BuiltEvents event;

  const EventDetailAppBar({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Flexible(
          flex: 3,
          child: Column(
            children: <Widget>[
              Text(
                event.event,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
