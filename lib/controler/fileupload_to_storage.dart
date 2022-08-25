import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UploadTOStorage {
  static FirebaseStorage storage = FirebaseStorage.instance;

  static Future<String?> uploadFile(
      {required String filename, required String? filepath}) async {
    File file = File(filepath.toString());
    try {
      await storage.ref('test/$filename').putFile(file);
      Fluttertoast.showToast(msg: 'File Upload Secs');
      final url = await storage.ref('test/$filename').getDownloadURL();

      print(url);
      return url;
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
      return null;
    }
  }
}
