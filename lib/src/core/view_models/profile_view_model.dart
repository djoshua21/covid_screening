import 'package:flutter/cupertino.dart';
import 'package:haefele_health_app/src/core/constants/constants.dart';
import 'package:haefele_health_app/src/core/services/auth_service.dart';
import 'package:haefele_health_app/src/core/services/user_service.dart';
import 'package:haefele_health_app/src/locator.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  final UserService _userService = locator<UserService>();
  final AuthService _authService = locator<AuthService>();
  String imageLink;
  String name;

  Future<void> profileInfo() async {
    final uid = _authService.currentUser.uid;

    final userData = await _userService.getUserData(uid);
    if (userData.data().containsKey('name')) {
      name = userData.data()['name'];
    }
    imageLink = await _userService.getImageURL(uid);
    notifyListeners();
  }

  Future<void> logout(BuildContext ctx) async {
    await _authService.logout();
    Navigator.of(ctx).pushReplacementNamed(RoutePaths.login);
  }
}
