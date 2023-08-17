import 'package:flutter/material.dart';
import 'package:flutter_ui_ecommerce_a/models/product.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void toggleProduct(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    ChangeNotifier();
  }

  incrementQuantity(int index) => _cart[index].quantity++;
  decrementQuantity(int index) =>
      _cart[index].quantity > 0 ? _cart[index].quantity-- : null;

  getTotalPrice() {
    double total = 0;
    for (Product element in _cart) {
      total += element.price * element.quantity;
    }
    return total;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
