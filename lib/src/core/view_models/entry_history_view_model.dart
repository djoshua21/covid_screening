import 'package:haefele_health_app/src/core/models/entry_model.dart';
import 'package:haefele_health_app/src/core/services/auth_service.dart';
import 'package:haefele_health_app/src/core/services/entry_service.dart';
import 'package:haefele_health_app/src/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EntryHistoryViewModel extends BaseViewModel {
  final EntryService _entryService = locator<EntryService>();
  final AuthService _authService = locator<AuthService>();
  List<EntryModel> entryList = [];

  Future<void> getEntries() async {
    final String uid = _authService.currentUser.uid;
    final QuerySnapshot<Map<String, dynamic>> _entries =
        await _entryService.getEntries(uid);

    _entries.docs.forEach((item) {
      entryList.add(EntryModel(
        location: item['location'] as String,
        dateTime: item['dateTime'].toDate(),
        temp: item['temperature'] as double,
      ));
    });

    notifyListeners();
  }
}
