import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/events/model/built_events.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(widget.event.event,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  )),
              background: Hero(
                tag: "${widget.event.event}.${widget.event.image}",
                child: Image.network(
                  widget.event.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.event.description,
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
