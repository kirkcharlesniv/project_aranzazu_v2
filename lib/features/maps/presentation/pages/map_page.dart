import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_aranzazu_v2/features/maps/presentation/bloc/bloc.dart';
import 'package:project_aranzazu_v2/features/maps/presentation/widgets/google_map_page_view.dart';
import 'package:project_aranzazu_v2/features/maps/presentation/widgets/google_map_widget.dart';
import 'package:project_aranzazu_v2/features/widgets/blocs/imports.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapsBloc _bloc;

  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<MapsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapsBloc, MapsState>(
        builder: (context, state) {
          final currentState = state;
          if (currentState is MapsUninitialized) {
            return UninitializedBlocWidget();
          }
          if (currentState is MapsError) {
            return ErrorBlocWidget();
          }

          if (currentState is MapsLoaded) {
            if (currentState.mapsSet.isEmpty) {
              return EmptyBlocWidget();
            }

            return Stack(
              children: <Widget>[
                GoogleMapWidget(
                    markers: currentState.mapsSet, controller: _controller),
                Positioned(
                  child: GoogleMapsPageView(
                    mapsList: currentState.mapsList,
                    controller: _controller,
                  ),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
