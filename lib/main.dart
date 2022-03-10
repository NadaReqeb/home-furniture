import 'package:Furniture/firestore/ui/check_out.dart';
import 'package:Furniture/firestore/ui/search_screen.dart';
import 'package:Furniture/firestore/ui/shop_items.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Furniture/firestore/providers/app_provider.dart';
import 'package:Furniture/firestore/ui/details_screen.dart';
import 'package:Furniture/firestore/ui/login_screen.dart';
import 'package:Furniture/firestore/ui/splach_screen.dart';
import 'package:Furniture/home_page.dart';
import 'package:Furniture/router_helper.dart';
import 'package:provider/provider.dart';

import 'firestore/ui/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child: MaterialApp(
      //    initialRoute: '/',
      // routes: {
      //   '/': (BuildContext context) => ShopItems(),
      //   '/checkout': (BuildContext context) => Checkout()
      // },
        debugShowCheckedModeBanner: false,
        navigatorKey: RouterHelper.routerHelper.routerKey,
        home: SplachScreen(),
      )));
}
