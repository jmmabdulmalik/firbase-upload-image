import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../next_screen.dart';
import 'fileupload_to_storage.dart';

class FilePicking {
  static Future filePick(BuildContext context) async {
    final pick = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'pdf'],
    );
    if (pick == null) {
      Fluttertoast.showToast(msg: 'No Any File Pick');
    }
    final path = pick!.files.single.path;
    final filename = pick.files.single.name;
    if (path == null) {
      Fluttertoast.showToast(msg: 'path is Empty');
    } else {
      String? url =
          await UploadTOStorage.uploadFile(filename: filename, filepath: path);
      if (url != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NextScreen(
            url: url,
          );
        }));
      }
    }
  }
}
