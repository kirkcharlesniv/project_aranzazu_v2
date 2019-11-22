import 'package:flutter/material.dart';

class ErrorBlocWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sorry',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "It's not you, it's us.",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w300, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "An unexpected error seems to have occured. We look forward improving your experience.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          Text('If the problem still persists, contact us.')
        ],
      ),
    );
  }
}
