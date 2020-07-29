import 'package:store_app/models/Cart_product.dart';
import 'package:store_app/models/product.dart';

class CartManager {
  List<CartProduct> items = [];

  void addToCart(Product product) {
    items.add(CartProduct.fromProduct(product));
  }
}
