import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modChat_App/views/signin.dart';
import 'package:modChat_App/views/home.dart';
import 'package:modChat_App/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
          //primarySwatch: Colors.blue,
          //visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return SignIn();
          }
        },
      ),
    );
  }
}
