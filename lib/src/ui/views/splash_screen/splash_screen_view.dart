import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/view_models/splash_screen_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.nonReactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (cont, model, child) {
        return FutureBuilder<void>(
          future: model.isLoggedIn(cont),
          builder: (ctx, snapshot) => Scaffold(
            body: Center(
              child: Text(
                'Haefele\nHealth',
                style: TextStyle(fontSize: 60),
              ),
            ),
          ),
        );
      },
    );
  }
}
