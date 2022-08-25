import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('view Screen'),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData && !snapshot.hasError) {
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('sam na'),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index];
                        return SizedBox(
                          height: 80,
                          child: InkWell(
                            onTap: () {},
                            child: Card(
                              elevation: 3.0,
                              child: ListTile(
                                title: Text(data['name']),
                                leading: CircleAvatar(
                                  radius: 20,
                                  child: Image.network(data['img']),
                                ),
                                trailing: Text(data['email']),
                              ),
                            ),
                          ),
                        );
                      });
                }
              } else if (snapshot.hasError) {
                return const Text('Some Error');
              } else {
                return const Text('No Have any Data');
              }
            }));
  }
}
