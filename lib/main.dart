import 'package:firbase_storage/next_screen.dart';
import 'package:firbase_storage/start_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controler/cubits/add_data_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddDataCubit(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.yellow,
        ),
        home: const StartScreen(),
      ),
    );
  }
}
