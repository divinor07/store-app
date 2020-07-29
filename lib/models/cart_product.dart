import 'package:store_app/models/item_size.dart';
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

  ItemSize get itemSize {
    if (product == null) return null;
    return product.findSize(size);
  }

  num get unitPrice {
    if (product == null) return 0;
    return itemSize?.price ?? 0;
  }
}
