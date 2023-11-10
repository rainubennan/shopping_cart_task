// import 'package:flutter/material.dart';

// class ProductCard extends StatefulWidget {

//   final String title;
//   final String pImage;
//   final num price;
//   Function(BuildContext) navigateTodetail;

//    ProductCard(
//       {required this.title, required this.price,required this.navigateTodetail, required this.pImage});

//   @override
//   State<ProductCard> createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {


//   @override
//   Widget build(BuildContext context) {
    // return Card(
    //   margin: const EdgeInsets.all(3.0),
    //   child: SingleChildScrollView(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Image(
    //             height: MediaQuery.of(context).size.height * .15,
    //             image: NetworkImage(
    //               widget.pImage,
    //             )),
    //         Text(
    //           widget.title,
    //           style: const TextStyle(fontSize: 13),
    //         ),
    //         Text('\$${widget.price.toStringAsFixed(2)}'),
    //         ElevatedButton(
    //           onPressed: navigateTodetail,
    //           child: const Text('View'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
//   }
// }