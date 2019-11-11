import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/main/dashboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingAlternative extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 125,
                child: Image.asset(
                  'assets/images/viva_icon.png',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Viva Aranzazu'.toUpperCase(),
                      style: TextStyle(
                          color: Color(0xffF83376),
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    Text(
                      ' PH'.toUpperCase(),
                      style: TextStyle(color: Color(0xffF83376), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'Welcome on our VIVA ARANZAZU PH!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('A Mobile App by the church, for the church.')
            ],
          ),
          Text('Be evangelized thru your palm.'),
          RaisedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool('welcome', true);

              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return CubertoBottomNavigationBar();
                }),
              );
            },
            color: Color(0xffF74662),
            textColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Viva!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
