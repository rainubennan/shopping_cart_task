import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_cart_task/model/cart_model.dart';
import 'package:shopping_cart_task/model/product_model.dart';

import 'package:shopping_cart_task/service/api_product.dart';
import 'package:shopping_cart_task/view/cart_screen.dart';

import 'single_product.dart';

class ProductGrid extends StatefulWidget {
  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  List<Product> data = [];
  final cart = Cart();
  bool isLoading = false;
  bool isAdded = false;

  @override
  void initState() {
    super.initState();
    print('initstate');
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
    //     Provider.of<DataProvider>(context, listen: false).getdata());
    getdata();
  }

  Future<void> getdata() async {
    final fetchProduct = await Service().productFetching();
    print(fetchProduct);
    setState(() {
      data = fetchProduct;
      print(data);
    });
  }

  void singleProductData(int? id) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SingleProduct(id: id)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Products'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartScreen(
                                cart: cart,
                              )));
                },
                icon: const Icon(Icons.shopping_bag))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: isLoading
            ? Center(child: Text('Please check your Internet'))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      singleProductData(data[index].id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 150,
                        width: 100,
                        child: Card(
                          margin: const EdgeInsets.all(5.0),
                          elevation: 1.0,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                    height: MediaQuery.of(context).size.height *
                                        .15,
                                    image: NetworkImage(data[index].image)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  child: Text(
                                    data[index].title,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('\$${data[index].price}'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}
