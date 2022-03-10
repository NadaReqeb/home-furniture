import 'package:Furniture/firestore/model/product.dart';
import 'package:Furniture/firestore/ui/details_screen.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Products products;
  // final SearchBarController<Products> _searchBarController =
  //     SearchBarController();
  // bool isReplay = false;

  // Future<List<Products>> getALlProducts(String text) async {
  //   await Future.delayed(Duration(seconds: text.length == 4 ? 10 : 1));
  //   if (isReplay) return [Products("Replaying !")];
  //   if (text.length == 5) throw Error();
  //   if (text.length == 6) return [];
  //   List<Products> products = [];

    // var random = new Random();
  //   for (int i = 0; i < 10; i++) {
  //     products.add(Products(
  //       "$text $i",
  //     ));
  //     //  "body random number : ${random.nextInt(100)}"
  //   }
  //   return products;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      //   child: SearchBar<Products>(
      //     searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
      //     headerPadding: EdgeInsets.symmetric(horizontal: 10),
      //     listPadding: EdgeInsets.symmetric(horizontal: 10),
      //     onSearch: getALlProducts,
      //     searchBarController: _searchBarController,
      //     placeHolder: Text("placeholder"),
      //     cancellationWidget: Text("Cancel"),
      //     emptyWidget: Text("empty"),
      //     indexedScaledTileBuilder: (int index) =>
      //         ScaledTile.count(1, index.isEven ? 2 : 1),
      //     header: Row(
      //       children: <Widget>[
      //         RaisedButton(
      //           child: Text("sort"),
      //           onPressed: () {
      //             _searchBarController.sortList((Products a, Products b) {
      //               return a.description.compareTo(b.description);
      //             });
      //           },
      //         ),
      //         RaisedButton(
      //           child: Text("Desort"),
      //           onPressed: () {
      //             _searchBarController.removeSort();
      //           },
      //         ),
      //         RaisedButton(
      //           child: Text("Replay"),
      //           onPressed: () {
      //             isReplay = !isReplay;
      //             _searchBarController.replayLastSearch();
      //           },
      //         ),
      //       ],
      //     ),
      //     onCancelled: () {
      //       print("Cancelled triggered");
      //     },
      //     mainAxisSpacing: 10,
      //     crossAxisSpacing: 10,
      //     crossAxisCount: 2,
      //     onItemFound: (Products products, int index) {
      //       return Container(
      //         color: Colors.lightBlue,
      //         child: ListTile(
      //           title: Text(products.name),
      //           isThreeLine: true,
      //           subtitle: Text(products.description),
      //           onTap: () {
      //             Navigator.of(context).push(
      //                 MaterialPageRoute(builder: (context) => DetailsPage()));
      //           },
      //         ),
      //       );
      //     },
      //   ),
      // ),
     ) );
    // return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Container(
//         child:

//       if (customIcon.icon == Icons.search) {
//    customIcon = const Icon(Icons.cancel);
//    customSearchBar = const ListTile(
//    leading: Icon(
//     Icons.search,
//     color: Colors.white,
//     size: 28,
//    ),
//    title: TextField(
//     decoration: InputDecoration(
//     hintText: 'type in journal name...',
//     hintStyle: TextStyle(
//      color: Colors.white,
//      fontSize: 18,
//      fontStyle: FontStyle.italic,
//     ),
//     border: InputBorder.none,
//     ),
//     style: TextStyle(
//     color: Colors.white,
//     ),
//    ),
//    );
//   }
    //   body: Column(
    //     children: [
    //       Container(
    //         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
    //         width: 350,
    //         height: 50,
    //         child: TextField(
    //           // cursorHeight: 10,
    //           decoration: InputDecoration(
    //               labelStyle:
    //                   TextStyle(color: Color.fromARGB(255, 19, 114, 90)),
    //               focusedBorder: OutlineInputBorder(
    //                 borderSide:
    //                     BorderSide(color: Color.fromARGB(255, 0, 131, 87)),
    //                 borderRadius: BorderRadius.circular(15),
    //               ),
    //               border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(15)),
    //               label: Text('Search')),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
// }
