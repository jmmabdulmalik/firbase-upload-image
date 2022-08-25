import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseAddData {
  static Future<bool> addData(
      {required String name,
      required String email,
      required String pass,
      required String img}) async {
    FirebaseFirestore User = FirebaseFirestore.instance;

    try {
      await User.collection('users').add({
        'name': name,
        'email': email,
        'password': pass,
        'img': img,
      });
    } on FirebaseException catch (e) {
      if (e is FirebaseException) {
        Fluttertoast.showToast(msg: e.message.toString());
      } else if (e is SocketException) {
        Fluttertoast.showToast(msg: e.message.toString());
      }
      print('false');
      return false;
    }
    print('true');
    return true;
  }
}
