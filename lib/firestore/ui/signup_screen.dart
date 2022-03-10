import 'package:flutter/material.dart';
import 'package:Furniture/home_page.dart';
import 'package:Furniture/router_helper.dart';
import 'package:lottie/lottie.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'SignUp',
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
                  Center(
                    child: Lottie.asset('assets/animations/furniture.json',
                        height: 150, width: 250),

                    // Image(
                    //   image: AssetImage('assets/images/logo.jpg'),
                    //   height: 150,
                    //   width: 150,
                    // ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: 350,
                          height: 50,
                          alignment: Alignment.center,
                          child: TextField(
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 19, 114, 90)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 131, 87)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
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
                          alignment: Alignment.center,
                          child: TextField(
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 19, 114, 90)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 131, 87)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                label: Text('Password')),
                            controller: passwordController,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: 350,
                          height: 50,
                          alignment: Alignment.center,
                          child: TextField(
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 19, 114, 90)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 131, 87)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                label: Text('Name')),
                            controller: nameController,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: 350,
                          height: 50,
                          alignment: Alignment.center,
                          child: TextField(
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 19, 114, 90)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 131, 87)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                label: Text('Phone')),
                            controller: phoneController,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: 350,
                          height: 50,
                          alignment: Alignment.center,
                          child: TextField(
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 19, 114, 90)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 131, 87)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                label: Text('Address')),
                            controller: addressController,
                          ),
                        ),
                        SizedBox(
                          height: 50,
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
                                  'SignUp',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
