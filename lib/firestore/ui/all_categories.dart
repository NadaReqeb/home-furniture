import 'package:Furniture/firestore/providers/app_provider.dart';
import 'package:Furniture/firestore/ui/add_category.dart';
import 'package:Furniture/router_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
          floatingActionButton: Visibility(
            visible: provider.loggedUser?.isAdmin ?? false,
            child: FloatingActionButton(
              child: Icon(Icons.new_label),
              onPressed: () {
                RouterHelper.routerHelper
                    .routingToSpecificWidgetWithoutPop(AddNewCategory());
              },
            ),
          ),
          appBar: AppBar(
            title: Text('All Categories'),
            actions: [
              IconButton(
                  onPressed: () {
                    provider.logOut();
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: provider.allCategories == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : provider.allCategories.isEmpty
                    ? Center(
                        child: Text('No Categories Found'),
                      )
                    : ListView.builder(
                        itemCount: provider.allCategories.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            background: Container(
                              alignment: Alignment.center,
                              color: Colors.red,
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            key: ObjectKey(provider.allCategories[index]),
                            onDismissed: (DismissDirection direction) {
                              provider.deleteCategory(
                                  provider.allCategories[index].catId);
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    provider.allCategories[index].catId),
                              ),
                              title: Text(provider.allCategories[index].name),
                              // subtitle: Row(
                              //   children: [
                              //     Text(provider.allCategories[index].description),
                              //     Spacer(),
                              //     Text(provider.allCategories[index].price
                              //             .toString() +
                              //         ' \$')
                              //   ],
                              // ),
                              // trailing: IconButton(
                              //     onPressed: () {
                              //       provider.goToEditProduct(
                              //           provider.a[index]);
                              //     },
                              //     icon: Icon(Icons.edit)),
                            ),
                          );
                        }),
          ));
    });
  }
}
