// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:shopping_cart_task/model/product_model.dart';

// class Cart {
//   late Box<ProductModel> _box;

//   Cart() {
//     _initHive();
//   }

//   Future<void> _initHive() async {
//     await Hive.initFlutter();
//     Hive.registerAdapter(ProductModelAdapter());
//     _box = await Hive.openBox<ProductModel>('cart');
//   }

//   List<ProductModel> get items => _box.values.toList();

//   double get total => items.fold(0.0, (prev, item) => prev + item.price);

//   void addToCart(ProductModel product) {
//     _box.add(product);
//   }

//   void removeFromCart(ProductModel product) {
//     _box.delete(product.key);
//   }
// }
