import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 22),
        children: <TextSpan>[
          TextSpan(
            text: 'Honesty',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
              fontSize: 20,
            ),
          ),
          TextSpan(
              text: ' 2.0',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
        ],
      ),
    );
  }
}
