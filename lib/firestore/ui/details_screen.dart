import 'dart:ui';

import 'package:Furniture/firestore/data/firestore_helper.dart';
import 'package:Furniture/firestore/model/product.dart';
import 'package:Furniture/firestore/providers/app_provider.dart';
import 'package:Furniture/firestore/ui/shop_items.dart';
import 'package:Furniture/home_page.dart';
import 'package:Furniture/router_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  Products products;
  DetailsPage({this.products});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 228, 205),
      appBar: AppBar(
        leading: Container(
            margin: EdgeInsets.only(left: 15, top: 15),
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    RouterHelper.routerHelper
                        .routingToSpecificWidgetWithoutPop(HomePage());
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Color.fromARGB(255, 64, 197, 153),
                  )),
              backgroundColor: Colors.white,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // backwardsCompatibility: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirestoreHelper.firestoreHelper.read(collectionName: 'Products'),
          builder: (context, snapshot) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Image.asset(
                    'assets/images/Minimal.png',
                    height: 200,
                    width: 200,
                    // fit: BoxFit.cover,
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                // child:
                //  Column(
                //   children: [
                // Image.asset(
                //   'assets/images/Rosswell.png',
                //   height: 250,
                //   width: 250,
                //   fit: BoxFit.cover,
                // )
                // ],
                // ),
                // ),

                // SizedBox(height: 30,),
                Spacer(),

                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lounge Chair',
                              style: TextStyle(fontSize: 20),
                            ),
                            Spacer(),
                            Text(
                              '\$35',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              'Sed ut ipsi auctori huius disciplinae placet:\n constituam, quid aut officiis debitis aut.\n In quo enim ipsam voluptatem, quia dolor sit,\n a sapiente delectus, ut earum.',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  height: 30,
                                  width: 30,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.blue,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor:
                                          Color.fromARGB(255, 37, 37, 37),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  height: 30,
                                  width: 30,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 236, 80, 132),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  height: 30,
                                  width: 30,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 91, 165, 94),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(194, 194, 194, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  // radius: BorderRadius.circular(10),
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.center,
                                      iconSize: 20,
                                      disabledColor:
                                          Color.fromARGB(255, 132, 202, 135),
                                      onPressed: (() {}),
                                      icon: Icon(Icons.exposure_minus_1)),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(194, 194, 194, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.center,
                                      iconSize: 20,
                                      disabledColor:
                                          Color.fromARGB(255, 132, 202, 135),
                                      onPressed: (() {}),
                                      icon: Icon(Icons.plus_one)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 90,
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 30),
                        margin: EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 223, 223, 223),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100))),
                        child: InkWell(
                          onTap: () {
                            RouterHelper.routerHelper
                                .routingToSpecificWidgetWithoutPop(ShopItems());
                          },
                          child: Row(
                            children: [
                              Icon(Icons.shopping_bag),
                             
                              
                              Text(
                                'Add to Cart',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Products getProduct(QueryDocumentSnapshot snapshot) {
    Products products = Products();
    products.path = snapshot.id;
    products.name = snapshot.get('name');
    products.price = snapshot.get('price');
    products.imageUrl = snapshot.get('imagePath');
    products.description = snapshot.get('description');
    // products.shortDescription = snapshot.get('shortDescription');
    // products.subCategoriesName = widget.nameSubCategories;

    return products;
  }

  Future<void> AddToCart(Products products) async {
    bool status = await FirestoreHelper.firestoreHelper
        .addProductCart(products: products);
  }
}
