import 'package:flutter/material.dart';
import 'package:Furniture/firestore/providers/app_provider.dart';
import 'package:Furniture/firestore/ui/widgets/custom_button.dart';
import 'package:Furniture/firestore/ui/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddNewProduct extends StatefulWidget {
  bool isForEdit;
  String productId;

  AddNewProduct({this.isForEdit = false, this.productId});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Product Screen'),
        backgroundColor: Color.fromARGB(255, 26, 148, 117),
      ),
      body: Consumer<AppProvider>(builder: (context, provider, x) {
        return Container(
            margin: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.pickNewImage();
                    },
                    child: provider.file == null
                        ? provider.imageUrl == null
                            ? CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 45, 207, 167),
                                radius: 90,
                              )
                            : CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 26, 148, 117),
                                radius: 90,
                                backgroundImage:
                                    NetworkImage(provider.imageUrl))
                        : CircleAvatar(
                            radius: 90,
                            backgroundColor: Color.fromARGB(255, 26, 148, 117),
                            backgroundImage: FileImage(provider.file)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
//                   DropdownButton(
//   value: _selectedLocation,
//   onChanged: (String newValue) {
//     setState(() {
//       _selectedLocation = newValue;
//      });
// },
// items: _locations.map((String location) {
//   return new DropdownMenuItem<String>(
//      child: new Text(location),
//   );
// }).toList(),
                  CustomTextfield(
                    controller: provider.nameController,
                    label: 'Name',
                  ),
                  CustomTextfield(
                    controller: provider.descriptionController,
                    label: 'Description',
                  ),
                  CustomTextfield(
                    controller: provider.priceController,
                    textInputType: TextInputType.number,
                    label: 'Price',
                  ),
                  widget.isForEdit
                      ? CustomButton(
                          title: 'Edit Product',
                          function: () {
                            provider.editProduct(this.widget.productId);
                          },
                        )
                      : CustomButton(
                          title: 'Add Product',
                          function: () {
                            // provider.addProduct();
                            Provider.of<AppProvider>(context, listen: false)
                                .addProduct();
                            Navigator.of(context).pop();
                          },
                        ),
                        Text('select Category'),
                  Container(
                    child: DropdownButton(
                        value: _selectedLocation,
                        onChanged: (String newValue) {
                          setState(() {
                            _selectedLocation = newValue;
                          });
                        },
                        items: <String>['Chairs', 'Sofas', 'Tabls', 'Lamps', 'kit']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()),
                  )
                ],
              ),
            ));
      }),
    );
  }
}
