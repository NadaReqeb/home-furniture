import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Furniture/firestore/ui/login_screen.dart';
import 'package:Furniture/firestore/ui/signup_screen.dart';
import 'package:Furniture/home_page.dart';
import 'package:Furniture/router_helper.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((v) {
      // User user = FirebaseAuth.instance.currentUser;
      // if (user == null) {
      //   RouterHelper.routerHelper.routingToSpecificWidget(SignUpPage());
      // } else {
      //   RouterHelper.routerHelper.routingToSpecificWidget(HomePage());
      // }
        RouterHelper.routerHelper.routingToSpecificWidget(LoginPage());
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/logo.jpg'))),
        ),
      ),
    );
  }
}
