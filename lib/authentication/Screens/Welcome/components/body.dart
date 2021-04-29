import 'package:Chatapp/authentication/components/social_icon.dart';
import 'package:Chatapp/authentication/components/or_divider.dart';
import 'package:Chatapp/authentication/page/logout.dart';
import 'package:flutter/material.dart';
import 'package:Chatapp/authentication/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO CHATAPP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            SocalIcon(
              iconSrc: "assets/icons/icons8-google.svg",
              press: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>LogOut(),
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "Get Started with google Signin",
              style: TextStyle( fontSize: 12),
            ),
            SizedBox(height: size.height * 0.02),
            ByDivider(),
            Text(
              "Arbaj AR7",
              style: TextStyle( fontSize: 12),
            ),
            Text(
              "Made with love in Nepal",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
