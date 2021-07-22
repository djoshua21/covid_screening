import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserService with ChangeNotifier {
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<void> uploadImage(File imageFile, String uid) async {
    try {
      await _firebaseStorage
          .ref('$uid/uploads/profile_pic.png')
          .putFile(imageFile);
    } catch (error) {
      throw error;
    }
  }

  Future<String> getImageURL(String uid) async {
    String url = await _firebaseStorage
        .ref('$uid/uploads/profile_pic.png')
        .getDownloadURL();
    return url;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) {
    return FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  Future<void> saveUserInfo({
    String uid,
    String name,
    String cellphone,
    String office,
    String code,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name,
      'cellphone': cellphone,
      'office': office,
      'code': code,
    });
  }
}
