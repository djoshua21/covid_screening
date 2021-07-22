import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EntryService with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getEntries(String uid) async {
    return _firestore
        .collection('entries')
        .doc(uid)
        .collection('userEntries')
        .orderBy('dateTime', descending: true)
        .get();
  }

  Future<void> saveEntry({
    String uid,
    String office,
    DateTime dateTime,
  }) async {
    await _firestore.collection('entries').doc(uid).set({
      'office': office,
      'timeStamp': dateTime,
    });
  }
}
