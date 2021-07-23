import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/constants/office_constants.dart';
import 'package:haefele_health_app/src/core/services/auth_service.dart';
import 'package:haefele_health_app/src/core/services/user_service.dart';
import 'package:haefele_health_app/src/locator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'dart:io';

import '../constants/constants.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();
  Offices _currentOffice;
  File image;

  Offices get currentOffice => _currentOffice;

  void _showErrorDialog(BuildContext ctx, String message) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred'),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("Okay"))
        ],
      ),
    );
  }

  get _office {
    switch (_currentOffice) {
      case Offices.capeTown:
        return OfficeConstants.capeTown;
      case Offices.australia:
        return OfficeConstants.australia;
      case Offices.johannesburg:
        return OfficeConstants.johannesburg;
      case Offices.london:
        return OfficeConstants.london;
    }
  }

  void changeOffice(Offices place) {
    _currentOffice = place;
    notifyListeners();
  }

  Future<void> handleSignUp({
    BuildContext ctx,
    String name,
    String email,
    String password,
    String cellphone,
    String code,
  }) async {
    setBusy(true);
    try {
      final uid = await _authService.signUp(email: email, password: password);
      await _userService.saveUserInfo(
        uid: uid,
        name: name,
        cellphone: cellphone,
        office: _office,
        code: code,
      );
      print('test');

      if (image != null) {
        await _userService.uploadImage(image, uid);
      }
      Navigator.of(ctx).pushReplacementNamed(RoutePaths.login);
    } catch (error) {
      var errorMessage = 'Sign Up failed';
      if (error.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
      _showErrorDialog(ctx, errorMessage);
    }
    setBusy(false);
  }

  Future<void> takePicture(ImageSource source) async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: source,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return null;
    }
    image = File(imageFile.path);
    notifyListeners();
  }
}
