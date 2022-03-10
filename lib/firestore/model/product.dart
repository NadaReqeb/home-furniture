import 'package:flutter/material.dart';

class Products {
  String catId;
  String id;
  String name;
  String description;
  num price;
  String path;
  String imageUrl;

  Products({
    String catId,
    this.id,
    this.name,
    this.description,
    this.price,
    this.path,
    this.imageUrl,
    // String name
  });
  Products.fromMap(Map<String, dynamic> map) {
    this.catId = map['catId'];
    this.id = map['id'];
    this.name = map['title'];
    this.description = map['description'];
    this.price = map['price'];
    this.imageUrl = map['imageUrl'];
  }
  toMap() {
    return {
      'catId': this.catId,
      'title': this.name,
      'description': this.description,
      'price': this.price,
      'imageUrl': this.imageUrl
    };
  }
}
