import 'package:store_app/models/product.dart';

class CartProduct {
  Product product;

  String productId;
  int quantity;
  String size;

  CartProduct.fromProduct(this.product) {
    productId = product.id;
    quantity = 1;
    size = product.selectedSize.name;
  }
}
