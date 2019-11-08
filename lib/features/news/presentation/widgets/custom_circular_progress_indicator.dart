import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          alignment: Alignment.center,
          child: Center(
            child: SizedBox(
              width: 33,
              height: 33,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
