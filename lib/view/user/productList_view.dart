// import 'package:TribalTrove/model/product_model.dart';
// import 'package:TribalTrove/view/user/productItem_view.dart';
// import 'package:flutter/material.dart';

// class ProductListView extends StatelessWidget {
//   ProductListView({super.key});

//   final List<Product> products = [
//     Product(
//         id: 1,
//         brand: 'Apple',
//         title: 'iPhone 9',
//         price: 549,
//         images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
//     Product(
//         id: 2,
//         brand: 'Apple',
//         title: 'iPhone 10',
//         price: 459,
//         images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
//     Product(
//         id: 1,
//         brand: 'Apple',
//         title: 'iPhone 9',
//         price: 549,
//         images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
//     Product(
//         id: 2,
//         brand: 'Apple',
//         title: 'iPhone 10',
//         price: 459,
//         images: 'https://i.dummyjson.com/data/products/2/1.jpg')
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: GridView(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 childAspectRatio: 1 / 1.73,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 crossAxisCount: 2),
//             children: [
//               // ...List.generate(
//               //   products.length,
//               //   (index) => ProductItem(product: products[index]),
//               // )
//             ],
//           ),
//         ),
//       ),
//       // bottomNavigationBar: const CustomBottomNavigationBar(
//       //   currentIndex: 0,
//       // ),
//     );
//   }
// }