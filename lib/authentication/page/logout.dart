import 'dart:async';

import 'package:Chatapp/app/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:Chatapp/authentication/blocs/auth_bloc.dart';
import 'package:Chatapp/authentication/page/login.dart';
import 'package:provider/provider.dart';

class LogOut extends StatefulWidget {
  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  StreamSubscription<User> loginStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Center(
          child: StreamBuilder<User>(
              stream: authBloc.currentUser,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                print(snapshot.data.photoURL);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data.displayName,style:TextStyle(fontSize: 35.0)),
                    SizedBox(height: 20.0,),
                    CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data.photoURL.replaceFirst('s96','s400')),
                      radius: 60.0,
                    ),
                    SizedBox(height: 100.0,),
                    SignInButton(
                        Buttons.Google,
                        text: 'Sign Out of Google',
                        onPressed: () => authBloc.logout()
                    ),
                    SizedBox(height: size.height * 0.10),
                    MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>Homepage(),
                              ),
                            );
                          },
                          color: Color(0xFF6F35A5),
                          textColor: Colors.white,
                          elevation: 10,
                          child: new Text("Go to Chat Tiles --->")),

                  ],

                );
              }
          ),

        ));
  }
}
