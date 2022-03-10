import 'dart:developer';
import 'dart:io';

import 'package:Furniture/firestore/model/Categories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Furniture/firestore/data/auth_helper.dart';
import 'package:Furniture/firestore/data/firestore_helper.dart';
import 'package:Furniture/firestore/model/fuser.dart';
import 'package:Furniture/firestore/model/product.dart';
import 'package:Furniture/firestore/ui/add_product.dart';
import 'package:Furniture/firestore/ui/all_products_screen.dart';
import 'package:Furniture/firestore/ui/login_screen.dart';
import 'package:Furniture/router_helper.dart';
import 'package:image_picker/image_picker.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    getAllProducts();
    getAllCategories();
  }
   
  FUser loggedUser;
  File file;
  String imageUrl;
  List<Products> allProducts;
  List<Categories> allCategories;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  pickNewImage() async {
    XFile file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file.path);
    notifyListeners();
  }

  register(FUser fUser) async {
    try {
      String userId = await AuthHelper.authHelper
          .createNewAccount(fUser.email, fUser.password);
      fUser.id = userId;
      await FirestoreHelper.firestoreHelper.createUserInfs(fUser);
      this.loggedUser = fUser;
      RouterHelper.routerHelper.routingToSpecificWidget(AllProductsScreen());
    } on Exception catch (e) {
      // TODO
    }
  }

  login(String email, String password) async {
    try {
      UserCredential userCredential =
          await AuthHelper.authHelper.signIn(email, password);
      await getUserFromFirebase();
      RouterHelper.routerHelper.routingToSpecificWidget(AllProductsScreen());
    } on Exception catch (e) {
      // TODO
    }
  }

  getUserFromFirebase() async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    this.loggedUser =
        await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
    notifyListeners();
  }

  logOut() async {
    this.loggedUser = null;
    await AuthHelper.authHelper.logout();

    RouterHelper.routerHelper.routingToSpecificWidget(LoginPage());
  }

  addProduct() async {
    String imageUrl =
        await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    Products product = Products(
        name : nameController.text,
        description: descriptionController.text,
        price: num.parse(priceController.text));
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.addNewProduct(product);
    getAllProducts();
    Navigator.of(RouterHelper.routerHelper.routerKey.currentState.context)
        .pop();
  }

  addCategory() async {
    String imageUrl =
        await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    Categories categories = Categories(name: nameController.text);
    // categories. = id;
    await FirestoreHelper.firestoreHelper.addNewCategory(categories);
    getAllCategories();
    Navigator.of(RouterHelper.routerHelper.routerKey.currentState.context)
        .pop();
  }

  editProduct(String productiD) async {
    log(productiD ?? 'null');
    if (file != null) {
      this.imageUrl =
          await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    }
    Products product = Products(
         id: productiD,
       name: nameController.text,
        description: descriptionController.text,
        price: num.parse(priceController.text),
        imageUrl: imageUrl);
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.editProduct(product);
    getAllProducts();
    Navigator.of(RouterHelper.routerHelper.routerKey.currentState.context)
        .pop();
  }

  editCategory(String catId) async {
    log(catId ?? 'null');
    if (file != null) {
      this.imageUrl =
          await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    }
  }

  //   Products products = Products(
  //  //   idCats: categoryId,
  //       id: productiD,
  //       name: nameController.text,
  //       description: descriptionController.text,
  //       price: num.parse(priceController.text));
  //   products.imageUrl = imageUrl;
  //   await FirestoreHelper.firestoreHelper.editProduct(product);
  //   getAllProducts();
  //   Navigator.of(RouterHelper.routerHelper.routerKey.currentState.context)
  //       .pop();
  // }

  goToEditProduct(Products product) {
    this.file = null;
    this.nameController.text = product.name;
    this.descriptionController.text = product.description;
    this.priceController.text = product.price.toString();
    this.imageUrl = product.imageUrl;
    notifyListeners();
    RouterHelper.routerHelper.routingToSpecificWidgetWithoutPop(AddNewProduct(
      isForEdit: true,
      productId: product.id,
    ));
  }

  getAllProducts() async {
    this.allProducts = await FirestoreHelper.firestoreHelper.getAllProducts();
    notifyListeners();
    return Products;
  }

  getAllCategories() async {
    this.allCategories =
        await FirestoreHelper.firestoreHelper.getAllCategories();
    notifyListeners();
  }

  deleteProduct(String productiD) async {
    await FirestoreHelper.firestoreHelper.deleteProduct(productiD);
    getAllProducts();
  }

  deleteCategory(String catId) async {
    await FirestoreHelper.firestoreHelper.deleteCategory(catId);
    getAllCategories();
  }
}
