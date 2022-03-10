import 'dart:ui';

import 'package:Furniture/firestore/data/auth_helper.dart';
import 'package:Furniture/firestore/providers/app_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Furniture/firestore/ui/signup_screen.dart';
import 'package:Furniture/home_page.dart';
import 'package:Furniture/router_helper.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'LOGIN',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 26, 148, 117),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child:
                            Lottie.asset('assets/animations/furniture.json')),

                    // Image(
                    //   image: AssetImage('assets/images/logo.jpg'),
                    //   height: 250,
                    //   width: 250,
                    // ),
                    SizedBox(
                      height: 50,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 350,
                            height: 50,
                            alignment: Alignment.center,
                            child: TextField(
                              decoration: InputDecoration(
                                  // enabledBorder: UnderlineInputBorder(
                                  //   borderSide: BorderSide(
                                  //       color: Color.fromARGB(255, 61, 146, 64)),
                                  // ),
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 19, 114, 90)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 0, 131, 87)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(15)),
                                  label: Text('Email')),
                              controller: emailController,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 350,
                            height: 50,
                            child: TextField(
                              // cursorHeight: 10,
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 19, 114, 90)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 0, 131, 87)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  label: Text('Password')),
                              controller: passwordController,
                            ),
                          ),
                          Container(
                            width: 300,
                            margin: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 5),
                            child: InkWell(
                              onTap: () {
                                AuthHelper.authHelper.forgetPassword(EmailAuthProvider.PROVIDER_ID);
                                // AppProvider.forgetPassword();
                              },
                              child: Text(
                                'forget password?',
                                style: TextStyle(color: Colors.grey),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 26, 148, 117),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 250,
                                height: 45,
                                // color: Colors.green,
                                child: TextButton(
                                  onPressed: () {
                                    RouterHelper.routerHelper
                                        .routingToSpecificWidget(HomePage());
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 250,
                            height: 45,
                            // color: Colors.green,
                            child: OutlinedButton(
                                onPressed: () {
                                  RouterHelper.routerHelper
                                      .routingToSpecificWidgetWithoutPop(
                                          SignUpPage());
                                },
                                child: Text(
                                  'Create New Account',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 26, 148, 117),
                                      fontSize: 20),
                                ),
                                style: ButtonStyle(
                                    side: MaterialStateProperty.all(BorderSide(
                                        width: 0.5,
                                        color:
                                            Color.fromARGB(255, 26, 148, 117),
                                        style: BorderStyle.solid)))),
                          ))

                          // TextButton(
                          //     onPressed: () {}, child: Text('Create New Account')),
                        ],
                      ),

                      // RaisedButton(
                      //   onPressed: () {},
                      //   child: Text('Login'),
                      // ),
                      // TextButton(
                      //     onPressed: () {}, child: Text('Create New Account')),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
