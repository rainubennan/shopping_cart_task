import 'dart:io';

import 'package:flutter/material.dart';

import 'package:shopping_cart_task/model/cart_model.dart';
import 'package:shopping_cart_task/model/product_element.dart';
import 'package:shopping_cart_task/model/product_model.dart';
import 'package:shopping_cart_task/service/api_product.dart';
import 'package:shopping_cart_task/view/cart_screen.dart';

class SingleProduct extends StatefulWidget {
  SingleProduct({super.key, required this.id});
  final int? id;

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  final List<ProductElement> products = [];
  bool isLoading = false;
  final cart = Cart();

  Product product =
      Product(category: '', description: '', image: '', title: '');

  bool isAdded = false;
  void initState() {
    super.initState();
    fetchsingleProduct();
  }

  Future<void> fetchsingleProduct() async {
    product = await Service().singleProduct(widget.id);
    setState(() {
      stdout.write(product);
    });
  }

  void addToCart() {
    if (!isAdded) {
      cart.addToCart(product);
      isAdded = true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.title} added to the cart.'),
        duration: Duration(seconds: 3),
      ),
    );
    setState(() {
      isAdded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // Consumer<CartProvider>(
        //   builder: (context, cartprovider, child) =>
        Scaffold(
            appBar: AppBar(
              title: Text(product.category),
            ),
            body:
                //  isLoading
                //     ?
                SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Image(
                        height: MediaQuery.of(context).size.height * .5,
                        image: NetworkImage(product.image)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.description,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 25),
                        child: Text(
                          '\$${product.price.toString()}',
                          style:
                              TextStyle(fontSize: 25, color: Colors.red[900]),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 15, right: 25),
                          child: isAdded
                              ? InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CartScreen(
                                                  cart: cart,
                                                  
                                                )));
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    color: Colors.red,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.keyboard_double_arrow_right),
                                        Text('Go To Chart')
                                      ],
                                    ),
                                  ),
                                )
                              : IconButton(
                                  onPressed: addToCart,

                                  // cartprovider.addToCart(),
                                  icon: Icon(
                                    Icons.shopping_bag_outlined,
                                    color: isAdded ? Colors.green : null,
                                    size: 30,
                                  ))),
                    ],
                  )
                ],
              ),
            )
            // : const Center(child: CircularProgressIndicator()),
            // ),
            );
  }
}
