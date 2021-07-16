import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserService with ChangeNotifier {
  Future<void> uploadImage(File imageFile, String uid) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;

    try {
      await firebaseStorage
          .ref('$uid/uploads/profile_pic.png')
          .putFile(imageFile);
    } catch (error) {
      throw error;
    }
  }

  Future<void> saveUserInfo({
    String uid,
    String name,
    String cellphone,
    String office,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name,
      'cellphone': cellphone,
      'office': office,
    });
  }
}
