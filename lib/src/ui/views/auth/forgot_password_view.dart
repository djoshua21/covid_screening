import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/constants/constants.dart';
import 'package:haefele_health_app/src/core/view_models/forgot_password_view_model.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();

    return ViewModelBuilder<ForgotPasswordViewModel>.nonReactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Haefele\nHealth',
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(height: 40),
              Text(
                "Enter you email address and we'll send you an email with instructions on how you can reset your password.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 4),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text('Send Email'),
                onPressed: () {
                  if (_emailController.text.isNotEmpty) {
                    model.resetPassword(context, _emailController.text);
                  }
                },
              ),
              SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RoutePaths.login);
                  },
                  child: Text('Switch to Login')),
            ],
          ),
        ),
      ),
    );
  }
}
