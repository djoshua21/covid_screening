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
      print('success');
    } catch (error) {
      print('failed');
    }
  }

  Future<void> saveUserInfo({
    String uid,
    String name,
    String cellphone,
    String office,
  }) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    await users.doc(uid).set({
      'name': name,
      'cellphone': cellphone,
      'office': office,
    });
    //print(response.toString());
  }
}
