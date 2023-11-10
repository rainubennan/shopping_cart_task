// class Cart{
//   String title;
//   String image;
//   num price;
//   Cart({
//     required this.title,
//     required this.image,
//     required this.price
//   });

// }

import 'package:shopping_cart_task/model/product_model.dart';

class Cart {
  final List<Product> items = [];
  double get total =>
      items.fold(0.0, (prev, item) => prev + (item.price ?? 0.0));
  void addToCart(Product product) {
    if (product.price != null) {
      print('product added1');
      items.add(product);
      print('product added2');
    }
  }

  void removeFromCart(Product product) {
    print('Inside cartlist');
    items.remove(product);
    print('removed item');
  }
}
