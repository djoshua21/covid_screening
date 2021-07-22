import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/view_models/profile_view_model.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text('profile page'),
        ),
      ),
    );
  }
}
