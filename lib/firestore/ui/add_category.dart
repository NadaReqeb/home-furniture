import 'package:Furniture/firestore/providers/app_provider.dart';
import 'package:Furniture/firestore/ui/widgets/custom_button.dart';
import 'package:Furniture/firestore/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewCategory extends StatelessWidget {
  bool isForEdit;
  String categoryId;
  AddNewCategory({this.isForEdit = false, this.categoryId});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Category Screen'),
        backgroundColor: Color.fromARGB(255, 26, 148, 117),
      ),
      body: Consumer<AppProvider>(builder: (context, provider, x) {
        return Container(
            margin: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextfield(
                    controller: provider.nameController,
                    label: 'Name',
                  ),

                  // CustomTextfield(
                  //   controller: provider.priceController,
                  //   textInputType: TextInputType.number,
                  //   label: 'Price',
                  // ),
                  isForEdit
                      ? CustomButton(
                          title: 'Edit Category',
                          function: () {
                            provider.editProduct(this.categoryId);
                          },
                        )
                      : CustomButton(
                          title: 'Add Category',
                          function: () {
                            // provider.addProduct();
                            Provider.of<AppProvider>(context, listen: false)
                                .addCategory();
                            Navigator.of(context).pop();
                          },
                        )
                ],
              ),
            ));
      }),
    );
  }
}
