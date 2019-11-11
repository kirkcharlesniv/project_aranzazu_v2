import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_aranzazu_v2/features/events/presentation/bloc/bloc.dart';
import 'package:project_aranzazu_v2/features/events/presentation/widgets/build_events_page.dart';
import 'package:project_aranzazu_v2/features/widgets/blocs/imports.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  EventsBloc _bloc;

  double currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<EventsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          final currentState = state;
          if (currentState is EventsUninitialized) {
            _bloc.add(FetchEvents());
            return UninitializedBlocWidget();
          }

          if (currentState is EventsError) {
            return ErrorBlocWidget();
          }

          if (currentState is EventsLoaded) {
            if (currentState.eventsList.isEmpty) {
              return EmptyBlocWidget();
            }
            PageController controller =
                PageController(initialPage: 0, viewportFraction: 0.8);
            controller.addListener(() {
              setState(() {
                currentPageValue = controller.page;
              });
            });

            return Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Flexible(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  currentState
                                      .eventsList[currentPageValue.round()]
                                      .event,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Center(
                                child: Text(
                                  currentState
                                      .eventsList[currentPageValue.round()]
                                      .date,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: GestureDetector(
                          child: PageView.builder(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            itemCount: currentState.eventsList.length,
                            itemBuilder: (context, index) {
                              bool active = index == currentPageValue.round();
                              return EventsPageWidgetBuilder(
                                event: currentState.eventsList[index],
                                active: active,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
