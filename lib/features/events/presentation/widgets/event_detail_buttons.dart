import 'package:flutter/material.dart';

class EventDetailButtons extends StatefulWidget {
  const EventDetailButtons({Key key}) : super(key: key);

  @override
  _EventDetailButtonsState createState() => _EventDetailButtonsState();
}

class _EventDetailButtonsState extends State<EventDetailButtons> {
  bool isRSVP;
  bool isInterested;

  @override
  void initState() {
    super.initState();
    isRSVP = false;
    isInterested = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          child: Row(
            children: <Widget>[
              Icon(
                (!isRSVP) ? Icons.star_border : Icons.star,
                color: (!isRSVP) ? Colors.black : Colors.orangeAccent,
              ),
              Text(' RSVP')
            ],
          ),
          onPressed: () {
            setState(() {
              isRSVP = !isRSVP;
            });
          },
        ),
        RaisedButton(
          child: Row(
            children: <Widget>[
              Icon(Icons.bookmark_border),
              Text(' Interested')
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
