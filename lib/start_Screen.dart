import 'package:flutter/material.dart';

import 'controler/file_picker.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 150,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
                onPressed: () async {
                  await FilePicking.filePick(context);
                },
                child: const Center(child: Text('Upload File'))),
          )
        ],
      ),
    );
  }
}
