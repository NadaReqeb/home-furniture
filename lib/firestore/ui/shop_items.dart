import 'package:Furniture/firestore/ui/cart_items_block.dart';
import 'package:Furniture/firestore/ui/check_out.dart';
import 'package:Furniture/router_helper.dart';
import 'package:flutter/material.dart';

class ShopItems extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        backgroundColor: Color.fromARGB(255, 26, 148, 117),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => RouterHelper.routerHelper.routingToSpecificWidget(Checkout()),
          )
        ],
      ),
      body: ShopItemsWidget(),
    );
  }
}

class ShopItemsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.allItems, // The bloc was already instantiated.
      stream: bloc.getStream, // The stream we'll be listing to
      builder: (context, snapshot) {
        // snapshot contains the data of the bloc
        return Center(child: Text("All items in shop have been taken"));
      },
    );
  }
}

Widget shopItemsListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["shop items"].length,
    itemBuilder: (BuildContext context, i) {
      final shopList = snapshot.data["shop items"];
      return ListTile(
        title: Text(shopList[i]['name']),
        subtitle: Text("\$${shopList[i]['price']}"),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            bloc.addToCart(shopList[i]);
            RouterHelper.routerHelper
                .routingToSpecificWidgetWithoutPop(Checkout());
          },
        ),
        onTap: () {},
      );
    },
  );
}
