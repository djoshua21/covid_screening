import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EntryService with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getEntries(String uid) async {
    return await _firestore
        .collection('entries')
        .where('uid', isEqualTo: uid)
        .orderBy('dateTime', descending: true)
        .get();
  }

  Future<void> saveEntry({
    String uid,
    String office,
    double temp,
    Timestamp dateTime,
  }) async {
    _firestore.collection('entries').add({
      'uid': uid,
      'location': office,
      'temperature': temp,
      'dateTime': dateTime,
    });
  }
}
