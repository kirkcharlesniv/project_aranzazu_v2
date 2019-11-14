import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_aranzazu_v2/features/events/presentation/bloc/bloc.dart';
import 'package:project_aranzazu_v2/features/main/dashboard_page.dart';
import 'package:project_aranzazu_v2/features/main/on_boarding_alt.dart';
import 'package:project_aranzazu_v2/features/widgets/blocs/error.dart';
import 'package:project_aranzazu_v2/features/widgets/blocs/imports.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../features/maps/presentation/bloc/bloc.dart';
import '../../features/news/presentation/bloc/bloc.dart';
import '../../features/news_search/presentation/bloc/bloc.dart';

class MyHome extends StatelessWidget {
  final httpClient = http.Client();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Scaffold(body: UninitializedBlocWidget());
          default:
            if (!snapshot.hasError) {
              return snapshot.data.getBool("welcome") != null
                  ? MultiBlocProvider(providers: [
                      BlocProvider<NewsBloc>(
                          builder: (context) =>
                              NewsBloc(httpClient: httpClient)),
                      BlocProvider<SearchBloc>(
                          builder: (context) =>
                              SearchBloc(httpClient: httpClient)),
                      BlocProvider<EventsBloc>(
                          builder: (context) =>
                              EventsBloc(httpClient: httpClient)
                                ..add(FetchEvents())),
                      BlocProvider<MapsBloc>(
                          builder: (context) => MapsBloc(httpClient: httpClient)
                            ..add(FetchMapsMarkers())),
                    ], child: CubertoBottomNavigationBar())
                  : OnboardingAlternative();
            } else {
              return Scaffold(
                body: ErrorBlocWidget(),
              );
            }
        }
      },
    );
  }
}
