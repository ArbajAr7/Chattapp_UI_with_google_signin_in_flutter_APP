import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Chatapp/authentication//Screens/Welcome/welcome_screen.dart';
import 'package:Chatapp/constants.dart';
import 'package:provider/provider.dart';

import 'authentication/blocs/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    ),
    );
  }
}
