import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:project_aranzazu_v2/features/events/presentation/bloc/events_bloc.dart';
import 'package:project_aranzazu_v2/features/events/presentation/bloc/events_event.dart';
import 'package:project_aranzazu_v2/features/news/presentation/bloc/news_bloc.dart';
import 'package:project_aranzazu_v2/features/news/presentation/bloc/news_event.dart';
import 'package:http/http.dart' as http;
import 'package:project_aranzazu_v2/features/news_search/presentation/bloc/bloc.dart';

import 'features/main/my_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final httpClient = http.Client();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viva Aranzazu!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NewsBloc>(
              builder: (context) => NewsBloc(httpClient: httpClient)),
          BlocProvider<SearchBloc>(
              builder: (context) => SearchBloc(httpClient: httpClient)),
          BlocProvider<EventsBloc>(
              builder: (context) =>
                  EventsBloc(httpClient: httpClient)..add(FetchEvents())),
        ],
        child: MyHome(),
      ),
    );
  }
}
