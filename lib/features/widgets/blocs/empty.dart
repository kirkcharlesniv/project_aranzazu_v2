import 'package:flutter/material.dart';

class EmptyBlocWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Oops!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "You tried to access something, but only to find that it's empty.",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
