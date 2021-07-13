import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
        ],
      ),
    ));
  }
}
