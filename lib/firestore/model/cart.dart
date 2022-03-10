import 'package:flutter_cart/flutter_cart.dart';

class Cart {
  var cart = FlutterCart();
  Cart.addToCart(
      {dynamic productId,
      dynamic unitPrice,
      int quantity,
      dynamic uniqueCheck,
      dynamic productDetailsObject});

  Cart.decrementItemFromCart(index);
  Cart.incrementItemToCart(index);
  Cart.getTotalAmount();
  Cart.getCartItemCount();
  Cart.getSpecificItemFromCart(cartId);
}
