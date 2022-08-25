import 'package:firbase_storage/view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'controler/cubits/add_data_cubit.dart';
import 'model/text_fields.dart';

class NextScreen extends StatelessWidget {
  String url;
  NextScreen({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController pass = TextEditingController();
    TextEditingController email = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Data')),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        children: [
          const SizedBox(
            height: 80,
          ),
          TextFields(
            hint: 'Name',
            icon: Icons.person,
            controler: name,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFields(
            hint: 'Email',
            icon: Icons.mail,
            controler: email,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFields(
            hint: 'Password',
            icon: Icons.lock,
            controler: pass,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: ElevatedButton(
              onPressed: () async {
                context.read<AddDataCubit>().addData(
                    name: name.text,
                    email: email.text,
                    pass: pass.text,
                    img: url);
              },
              child: BlocConsumer<AddDataCubit, AddDataState>(
                listener: (context, state) {
                  if (state is AddDataloaded) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ViewScreen();
                    }));
                  }
                },
                builder: (context, state) {
                  if (state is AddDataloading) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Text('Upload Data');
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
