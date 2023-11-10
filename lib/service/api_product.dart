import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_cart_task/model/product_model.dart';

class Service {
  Future<List<Product>> productFetching() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final List<dynamic> productData = jsonDecode(response.body);
        print(response.body);
        final newData = productData.map((e) {
          return Product(
            id: e['id'],
            title: e['title'],
            price: e['price'],
            description: e['description'],
            category: e['category'],
            image: e['image'],
          );
        }).toList();
        return newData;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in productFetching: $e');
      throw Exception('Failed to fetch product data: $e');
    }
  }

  Future<Product> singleProduct(int? id) async {
    try {
      final response = await http
          .get(Uri.parse('https://fakestoreapi.com/products/${id.toString()}'));

      if (response.statusCode == 200) {
        final dynamic singledata = jsonDecode(response.body);
        final newData = Product(
          id: singledata['id'],
          title: singledata['title'],
          price: singledata['price'],
          description: singledata['description'],
          category: singledata['category'],
          image: singledata['image'],
        );
        return newData;
      } else {
        throw Exception('Failed to load details');
      }
    } catch (e) {
      print('An error occurred while fetching the product details: $e');

      rethrow;
    }
  }
}
