import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MaterialApp(home: first(),));
}

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('cdmi');
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      
      
      body: Column(children: [
        
        TextField(
          controller: t1,
        ),
        
        TextField(
          controller: t2,
        ),
        
        ElevatedButton(onPressed: () {

          String name=t1.text;
          String contact=t2.text;

          users
              .add({
            'name': name, // John Doe
            'contact': contact, // Stokes and Sons
          })
              .then((value) {
            print("User Added");
          })
              .catchError((error) => print("Failed to add user: $error"));

        }, child: Text("Submit"))
      ],),
    );
  }
}
