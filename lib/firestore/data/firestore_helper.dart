import 'dart:developer';
import 'dart:io';

import 'package:Furniture/firestore/model/Categories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:Furniture/firestore/model/fuser.dart';
import 'package:Furniture/firestore/model/product.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  createUserInfs(FUser fUser) async {
    firebaseFirestore.collection('users').doc(fUser.id).set(fUser.toMap());
  }

  Future<FUser> getUserFromFs(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firebaseFirestore.collection('users').doc(id).get();
    Map<String, dynamic> userData = document.data();
    userData['id'] = document.id;
    FUser fUser = FUser.fromMap(userData);
    return fUser;
  }

  addNewProduct(Products product) async {
    DocumentReference<Map<String, dynamic>> doc =
        await firebaseFirestore.collection('products').add(product.toMap());
    log(doc.id);
  }

  addNewCategory(Categories categories) async {
    DocumentReference<Map<String, dynamic>> doc = await firebaseFirestore
        .collection('categories')
        .add(categories.toMap());
    log(doc.id);
  }

  Future<String> uploadImage(File file) async {
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    Reference reference = firebaseStorage.ref('Products/$fileName');
    await reference.putFile(file);
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }

  editProduct(Products newProduct) async {
    await firebaseFirestore
        .collection('products')
        .doc(newProduct.id)
        .update(newProduct.toMap());
  }

  deleteProduct(String productId) async {
    await firebaseFirestore.collection('products').doc(productId).delete();
  }

  deleteCategory(String catsId) async {
    await firebaseFirestore.collection('categories').doc(catsId).delete();
  }

  Future<Products> getOneProduct(String productId) async {
    DocumentSnapshot<Map<String, dynamic>> productSnapshot =
        await firebaseFirestore.collection('products').doc(productId).get();
    Map<String, dynamic> productMap = productSnapshot.data();
    productMap['id'] = productSnapshot.id;
    Products product = Products.fromMap(productMap);
    return product;
  }

  Stream<QuerySnapshot> read({String collectionName}) async* {
    yield* firebaseFirestore.collection(collectionName).snapshots();
  }

  Future<List<Products>> getAllProducts() async {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
        await firebaseFirestore.collection('products').get();

    List<Products> allProducts = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      Products product = Products.fromMap(documentMap);
      return product;
    }).toList();
    return allProducts;
  }

  Future<bool> addProductCart({
    Products products,
  }) async {
    return await firebaseFirestore
        .collection('ItemCart')
        .doc(firebaseUser.uid)
        .collection('id')
        .doc(products.path)
        .set({
          "imageUrl": products.imageUrl,
          "name": products.name,
          'price': products.price
        })
        .then((value) => true)
        .catchError((error) => false);
  }

  addProductToCart(Products product) async {
    String myid = FirebaseAuth.instance.currentUser.uid;
    firebaseFirestore
        .collection('users')
        .doc(myid)
        .collection('cart')
        .add(product.toMap());
  }

  Future<List<Categories>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> allCategoriesSnapshot =
        await firebaseFirestore.collection('categories').get();

    List<Categories> allCategories = allCategoriesSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      Categories categories = Categories.fromMap(documentMap);
      return categories;
    }).toList();
    return allCategories;
  }
}
