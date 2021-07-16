import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/constants/constants.dart';
import 'package:haefele_health_app/src/core/view_models/login_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/services.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey();
  final _authData = {'email': '', 'password': ''};

  void _login(BuildContext context, LoginViewModel model) {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      model.handleLogin(
        context,
        _authData['email'],
        _authData['password'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Haefele\nHealth',
              style: TextStyle(fontSize: 50),
            ),
            Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 4),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter An Email Address';
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return 'Invalid Email address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData['email'] = value;
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 4),
                      child: TextFormField(
                        onFieldSubmitted: (_) => _login(context, model),
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length <= 6) {
                            return 'Password too short';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData['password'] = value;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    model.isBusy
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () => _login(context, model),
                            child: Text('Login'),
                          ),
                    SizedBox(height: 15),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(RoutePaths.forgot);
                        }, child: Text('Forgot password')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(RoutePaths.signUp);
                        },
                        child: Text('Switch to SignUp')),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
