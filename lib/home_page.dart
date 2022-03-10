import 'package:Furniture/firestore/ui/add_category.dart';
import 'package:Furniture/firestore/ui/all_products_screen.dart';
import 'package:Furniture/firestore/ui/details_screen.dart';
import 'package:Furniture/firestore/ui/search_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:Furniture/firestore/providers/app_provider.dart';
import 'package:Furniture/firestore/ui/add_product.dart';
import 'package:Furniture/router_helper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
   List categories = ['Chairs', 'Sofas', 'Tabels', 'Lamps', 'Kit'];
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                RouterHelper.routerHelper
                    .routingToSpecificWidgetWithoutPop(AddNewProduct());
              },
              icon: Icon(Icons.add),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {
                RouterHelper.routerHelper
                    .routingToSpecificWidgetWithoutPop(AddNewCategory());
              },
              icon: Icon(Icons.new_label),
              color: Colors.black,
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, right: 25, left: 25, bottom: 25),
              child: Row(
                children: [
                  Text(
                    'What item are you \nlooking for?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        RouterHelper.routerHelper
                            .routingToSpecificWidget(SearchScreen());
                        // Colors.green;
                      },
                      // focusColor: Colors.green,
                      hoverColor: Colors.grey,
                      icon: Icon(Icons.search),
                      color: Colors.black)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 10,
                            right: index == provider.allCategories.length - 1
                                ? 5
                                : 0),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: index == selectedIndex
                              ? Color.fromARGB(255, 64, 197, 153)
                                  .withOpacity(0.7)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          categories[index].toString(),
                          // provider.allCategories[index].toString(),
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 700,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemCount: provider.allProducts.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              products: provider.allProducts[index],
                            ),
                          ),
                        );
                        // RouterHelper.routerHelper
                        //     .routingToSpecificWidget(DetailsPage(products: provider.allProducts[index],));
                      }),
                      child: Container(
                          height: 350,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Column(children: [
                            Image.network(
                              provider.allProducts[index].imageUrl,
                              height: 120,
                              width: 120,
                              // fit: BoxFit.cover,
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(provider.allProducts[index].name,
                                    maxLines: 1),
                                Spacer(),
                                Text(provider.allProducts[index].price
                                        .toString() +
                                    ' \$'),
                              ],
                            )
                          ])),
                    );
                  }),
            )
          ],
        )),
      );
    });
  }
}
