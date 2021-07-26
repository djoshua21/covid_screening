import 'package:flutter/material.dart';
import 'package:covid_screening_app/src/core/view_models/splash_screen_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.nonReactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onModelReady: (model) => model.isLoggedIn(context),
      builder: (ctx, model, child) {
        return Scaffold(
          body: Center(
            child: Text(
              'Haefele\nHealth',
              style: TextStyle(fontSize: 60),
            ),
          ),
        );
      },
    );
  }
}
