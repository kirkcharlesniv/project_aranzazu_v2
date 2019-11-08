import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/main/dashboard_page.dart';
import 'package:project_aranzazu_v2/features/main/on_boarding_alt.dart';
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
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          default:
            if (!snapshot.hasError) {
              return snapshot.data.getBool("welcome") != null
                  ? new DashboardPage()
                  : new OnboardingAlternative();
            } else {
              print(snapshot.error);
              return new Scaffold(
                body: Center(
                  child: Text(snapshot.error),
                ),
              );
            }
        }
      },
    );
  }
}
