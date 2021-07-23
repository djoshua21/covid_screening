import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haefele_health_app/src/core/constants/office_constants.dart';
import 'package:haefele_health_app/src/core/services/auth_service.dart';
import 'package:haefele_health_app/src/core/services/entry_service.dart';
import 'package:haefele_health_app/src/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class AddEntryViewModel extends BaseViewModel {
  final EntryService _entryService = locator<EntryService>();
  final AuthService _authService = locator<AuthService>();
  Offices _currentOffice;

  bool chk1 = false;
  bool chk2 = false;
  bool chk3 = false;

  Offices get currentOffice => _currentOffice;

  void _showErrorDialog(BuildContext ctx, String message) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('An error occurred'),
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

  Future<void> handleEntry(BuildContext ctx, String temperature) async {
    setBusy(true);
    final uid = _authService.currentUser.uid;
    try {
      final temp = double.parse(temperature.replaceAll(',', '.'));

      if (temp > 37) {
        throw ErrorDescription('Temperature is too high.');
      }

      if (!chk1 || !chk2 || !chk3) {
        throw ErrorDescription('One or more boxes have not been checked.');
      }

      if (_currentOffice == null) {
        throw ErrorDescription('Please choose an office');
      }

      await _entryService.saveEntry(
        uid: uid,
        office: _office,
        temp: temp,
        dateTime: Timestamp.now(),
      );
      Navigator.of(ctx).pop();
    } catch (error) {
      print(error);
      _showErrorDialog(ctx, error.toString());
    }
  }
}
