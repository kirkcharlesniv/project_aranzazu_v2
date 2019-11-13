import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/main/dashboard_page.dart';
import 'package:project_aranzazu_v2/features/main/on_boarding_alt.dart';
import 'package:project_aranzazu_v2/features/widgets/blocs/error.dart';
import 'package:project_aranzazu_v2/features/widgets/blocs/imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHome extends StatelessWidget {
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
                  ? CubertoBottomNavigationBar()
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
