// import 'package:TribalTrove/model/product_model.dart';
// import 'package:TribalTrove/view/constants/global_variables.dart';
// import 'package:TribalTrove/view/user/carousel_view.dart';
// import 'package:TribalTrove/view/user/productItem_view.dart';
// import 'package:TribalTrove/view/user/productList_view.dart';
// import 'package:TribalTrove/view/user/searchbox_view.dart';
// import 'package:TribalTrove/view/user/top_categories_view.dart';
// import 'package:TribalTrove/widgets/product_card.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class DashboardPageUser extends StatefulWidget {
//   // final Product product;

//   const DashboardPageUser({super.key});

//   @override
//   State<DashboardPageUser> createState() => _DashboardPageUserState();
// }

// class _DashboardPageUserState extends State<DashboardPageUser> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Business',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 3: Settings',
//       style: optionStyle,
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

// // Helper function to build a responsive product column
//   Widget _buildProductColumn(
//     String imagePath,
//     String title,
//     String seller,
//     String price,
//   ) {
//     return Column(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.width > 600 ? 220 : 150,
//           width: MediaQuery.of(context).size.width > 600 ? 220 : 150,
//           child: Image.asset(
//             imagePath,
//             fit: BoxFit.cover,
//           ),
//         ),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: MediaQuery.of(context).size.width > 600 ? 24 : 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           seller,
//           style: TextStyle(
//             fontSize: MediaQuery.of(context).size.width > 600 ? 20 : 16,
//             color: Colors.red,
//           ),
//         ),
//         Text(
//           price,
//           style: TextStyle(
//             fontSize: MediaQuery.of(context).size.width > 600 ? 26 : 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }

//   // int _selectedIndex = 0;
//   // static const TextStyle optionStyle =
//   //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   // static const List<Widget> _widgetOptions = <Widget>[
//   //   Text(
//   //     'Index 0: Home',
//   //     style: optionStyle,
//   //   ),
//   //   Text(
//   //     'Index 1: Business',
//   //     style: optionStyle,
//   //   ),
//   //   Text(
//   //     'Index 2: School',
//   //     style: optionStyle,
//   //   ),
//   // ];

//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     _selectedIndex = index;
//   //   });
//   // }

//   void navigateToCategoryPage(BuildContext context, String category) {
//     // Navigator.pushNamed(context, CategoryDealsScreen.routeName,
//     //     arguments: category);
//   }

//   // _buildAllProducts() => GridView.builder(
//   //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//   //         crossAxisCount: 2,
//   //         childAspectRatio: (100 / 140),
//   //         crossAxisSpacing: 12,
//   //         mainAxisSpacing: 12,
//   //       ),
//   //       scrollDirection: Axis.vertical,
//   //       itemCount: GlobalVariables.allProducts.length,
//   //       itemBuilder: (context, index) {
//   //         final allProducts = GlobalVariables.allProducts[index];
//   //         return ProductCard(product: allProducts);
//   //       },
//   //     );

//   static final TextEditingController _searchController =
//       TextEditingController();
//   void navigateToSearchScreen(String query) {
//     // Navigator.pushNamed(context,, arguments: query);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: 
//       PreferredSize(
//         preferredSize:
//             const Size.fromHeight(80), // Increased height for the AppBar
//         child: AppBar(
//           automaticallyImplyLeading: false,
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(),
//           ),
//           title: Row(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/logo.png"),
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 height: 150, // Increased height for the logo
//                 width: 220, // Increased width for the logo
//               ),
//               Spacer(), // Expands the space between the logo and icons
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.shopping_cart_outlined),
//                       onPressed: () {
//                         // Handle shopping cart action
//                       },
//                       iconSize: 30, // Increased icon size for the shopping cart
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.person_outline),
//                       onPressed: () {
//                         // Handle person icon action
//                       },
//                       iconSize: 30, // Increased icon size for the person icon
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       // drawer: Drawer(
//       //   child: ListView(
//       //     // Important: Remove any padding from the ListView.
//       //     padding: EdgeInsets.zero,
//       //     children: [
//       //       const UserAccountsDrawerHeader(
//       //         // <-- SEE HERE
//       //         decoration: BoxDecoration(color: const Color(0xff764abc)),
//       //         accountName: Text(
//       //           "Pinkesh Darji",
//       //           style: TextStyle(
//       //             fontWeight: FontWeight.bold,
//       //           ),
//       //         ),
//       //         accountEmail: Text(
//       //           "pinkesh.earth@gmail.com",
//       //           style: TextStyle(
//       //             fontWeight: FontWeight.bold,
//       //           ),
//       //         ),
//       //         currentAccountPicture: FlutterLogo(),
//       //       ),
//       //       ListTile(
//       //         leading: Icon(
//       //           Icons.home,
//       //         ),
//       //         title: const Text('Page 1'),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //         },
//       //       ),
//       //       ListTile(
//       //         leading: Icon(
//       //           Icons.train,
//       //         ),
//       //         title: const Text('Page 2'),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //         },
//       //       ),
//       //     ],
//       //   ),
//       // ),
//       body: 
//       SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: TextField(
//                   controller: _searchController,
//                   style: TextStyle(fontSize: 18.0), // Increased font size
//                   decoration: InputDecoration(
//                     filled: true,
//                     hintText: 'Search',
//                     contentPadding: const EdgeInsets.all(12.0),
//                     suffixIcon: IconButton(
//                       icon: Icon(Icons.clear, size: 24.0),
//                       color: GlobalVariables.greyColor,
//                       onPressed: () => _searchController.clear(),
//                     ),
//                     prefixIcon: IconButton(
//                       icon: Icon(Icons.search, size: 24.0),
//                       color: GlobalVariables.greyColor,
//                       onPressed: () {
//                         // Perform the search here
//                       },
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                       borderSide:
//                           BorderSide(color: GlobalVariables.outlineColor),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             SizedBox(
//               height: MediaQuery.of(context).size.height *
//                   0.02, // Increased for responsiveness
//             ),

//             SizedBox(
//               height: 60,
//               child: Row(
//                 mainAxisAlignment:
//                     MainAxisAlignment.spaceEvenly, // Added for spacing
//                 children: List.generate(
//                   GlobalVariables.categoryImages.length,
//                   (index) {
//                     double itemSize = MediaQuery.of(context).size.width *
//                         0.08; // Adjusted for responsiveness

//                     return GestureDetector(
//                       onTap: () => navigateToCategoryPage(
//                         context,
//                         GlobalVariables.categoryImages[index]['title']!,
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: itemSize * 0.2),
//                             child: ClipRRect(
//                               borderRadius:
//                                   BorderRadius.circular(itemSize * 0.5),
//                               child: Image.asset(
//                                 GlobalVariables.categoryImages[index]['image']!,
//                                 fit: BoxFit.cover,
//                                 height: itemSize,
//                                 width: itemSize,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 8, // Increased gap between category items
//                           ),
//                           Text(
//                             GlobalVariables.categoryImages[index]['title']!,
//                             style: TextStyle(
//                               fontSize: MediaQuery.of(context).size.width *
//                                   0.03, // Adjusted for responsiveness
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//               Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),

//             // SizedBox(
//             //     height: 60,
//             //     child: ListView.builder(
//             //       itemCount: GlobalVariables.categoryImages.length,
//             //       scrollDirection: Axis.horizontal,
//             //       itemExtent: 100.0, // Adjusted default item extent
//             //       itemBuilder: (context, index) {
//             //         double itemSize = MediaQuery.of(context).size.width *
//             //             0.15; // Adjusted based on screen width

//             //         return GestureDetector(
//             //           onTap: () => navigateToCategoryPage(
//             //             context,
//             //             GlobalVariables.categoryImages[index]['title']!,
//             //           ),
//             //           child: Column(
//             //             children: [
//             //               Container(
//             //                 padding: EdgeInsets.symmetric(
//             //                     horizontal: itemSize * 0.2),
//             //                 child: ClipRRect(
//             //                   borderRadius:
//             //                       BorderRadius.circular(itemSize * 0.5),
//             //                   child: Image.asset(
//             //                     GlobalVariables.categoryImages[index]['image']!,
//             //                     fit: BoxFit.cover,
//             //                     height: itemSize,
//             //                     width: itemSize,
//             //                   ),
//             //                 ),
//             //               ),
//             //               SizedBox(height: 8.0),
//             //               Text(
//             //                 GlobalVariables.categoryImages[index]['title']!,
//             //                 style: TextStyle(
//             //                   fontSize: itemSize * 0.3, // Adjusted font size
//             //                   fontWeight: FontWeight.w400,
//             //                 ),
//             //               ),
//             //             ],
//             //           ),
//             //         );
//             //       },
//             //     )),
//             SizedBox(
//               height: MediaQuery.of(context).size.height *
//                   0.08, // Increased for responsiveness
//             ),

//             CarouselSlider(
//               items: GlobalVariables.carouselImages.map(
//                 (i) {
//                   return Builder(
//                     builder: (BuildContext context) => Image.asset(
//                       i,
//                       fit: BoxFit.cover,
//                       height:
//                           MediaQuery.of(context).size.width > 600 ? 400 : 200,
//                     ),
//                   );
//                 },
//               ).toList(),
//               options: CarouselOptions(
//                 height: MediaQuery.of(context).size.width > 600 ? 400 : 200,
//                 viewportFraction:
//                     MediaQuery.of(context).size.width > 600 ? 0.8 : 1.0,
//               ),
//             ),

//             // CarouselSlider(
//             //   items: GlobalVariables.carouselImages.map(
//             //     (i) {
//             //       return Builder(
//             //         builder: (BuildContext context) => Image.asset(
//             //           i,
//             //           fit: BoxFit.cover,
//             //           height: 300,
//             //         ),
//             //       );
//             //     },
//             //   ).toList(),
//             //   options: CarouselOptions(
//             //     viewportFraction: 1,
//             //     height: 200,
//             //   ),
//             // ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               "Recommended Items",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: MediaQuery.of(context).size.width > 600 ? 24 : 20,
//               ),
//             ),
//             Column(children: [
//               Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildProductColumn(
//                         'assets/images/homeDecors.jpg',
//                         'Wooden Statue',
//                         'Himalaya Crafts',
//                         'Rs 5000',
//                       ),
//                       _buildProductColumn(
//                         'assets/images/clothes.jpg',
//                         'Hippie T-shirt',
//                         'Shakya Pashmina Store',
//                         'Rs 1200',
//                       ),
//                       // Add more product columns as needed
//                     ],
//                   ),
//                 ),
//               ),

//               // Padding(
//               //   padding: const EdgeInsets.all(20.0),
//               //   child: Padding(
//               //     padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//               //     child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //       // crossAxisAlignment: CrossAxisAlignment.stretch,
//               //       children: [
//               //         Column(
//               //           children: [
//               //             SizedBox(
//               //               height: 130,
//               //               width: 130,
//               //               child: Image.asset(
//               //                 'assets/images/homeDecors.jpg',
//               //                 // widget.product.images,
//               //                 fit: BoxFit.cover,
//               //               ),
//               //             ),
//               //             Text(
//               //               'Wooden Statue',
//               //               // widget.product.title,
//               //               style: const TextStyle(
//               //                 fontSize: 16,
//               //                 fontWeight: FontWeight.bold,
//               //               ),
//               //             ),
//               //             Text(
//               //               'Himalaya Crafts',
//               //               // widget.product.seller,
//               //               style: const TextStyle(
//               //                 fontSize: 14,
//               //                 color: Colors.red,
//               //               ),
//               //             ),
//               //             Text(
//               //               "Rs 5000",
//               //               // ('\$' '${widget.product.price}'),
//               //               style: const TextStyle(
//               //                   fontSize: 18, fontWeight: FontWeight.bold),
//               //             ),
//               //           ],
//               //         ),
//               //         // Icon(
//               //         //   Icons.favorite_border_outlined,
//               //         //   color: GlobalVariables.redColor,
//               //         // ),
//               //         Column(
//               //           children: [
//               //             SizedBox(
//               //               height: 130,
//               //               width: 130,
//               //               child: Image.asset(
//               //                 'assets/images/clothes.jpg',
//               //                 // widget.product.images,
//               //                 fit: BoxFit.cover,
//               //               ),
//               //             ),
//               //             Text(
//               //               'Hippie T-shirt',
//               //               // widget.product.title,
//               //               style: const TextStyle(
//               //                 fontSize: 16,
//               //                 fontWeight: FontWeight.bold,
//               //               ),
//               //             ),
//               //             Text(
//               //               'Shakya Pashmina Store',
//               //               // widget.product.seller,
//               //               style: const TextStyle(
//               //                 fontSize: 14,
//               //                 color: Colors.red,
//               //               ),
//               //             ),
//               //             Text(
//               //               "Rs 1200",
//               //               // ('\$' '${widget.product.price}'),
//               //               style: const TextStyle(
//               //                   fontSize: 18, fontWeight: FontWeight.bold),
//               //             ),
//               //           ],
//               //         ),
//               //         // Icon(
//               //         //   Icons.favorite_border_outlined,
//               //         //   color: GlobalVariables.redColor,
//               //         // )
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     // crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Column(
//                         children: [
//                           SizedBox(
//                             height: 130,
//                             width: 130,
//                             child: Image.asset(
//                               'assets/images/ceramics.jpg',
//                               // widget.product.images,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Text(
//                             'Ceramic Dining Set',
//                             // widget.product.title,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'Bajey ko Ceramics',
//                             // widget.product.seller,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Colors.red,
//                             ),
//                           ),
//                           Text(
//                             "Rs 3000",
//                             // ('\$' '${widget.product.price}'),
//                             style: const TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       // Icon(
//                       //   Icons.favorite_border_outlined,
//                       //   color: GlobalVariables.redColor,
//                       // ),
//                       Column(
//                         children: [
//                           SizedBox(
//                             height: 130,
//                             width: 130,
//                             child: Image.asset(
//                               'assets/images/arts.jpg',
//                               // widget.product.images,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Text(
//                             'Goddess Chamunda ',
//                             // widget.product.title,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'Everest Thangka Shop',
//                             // widget.product.seller,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Colors.red,
//                             ),
//                           ),
//                           Text(
//                             "Rs 10,000",
//                             // ('\$' '${widget.product.price}'),
//                             style: const TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       // Icon(
//                       //   Icons.favorite_border_outlined,
//                       //   color: GlobalVariables.redColor,
//                       // )
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     // crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Column(
//                         children: [
//                           SizedBox(
//                             height: 130,
//                             width: 130,
//                             child: Image.asset(
//                               'assets/images/ceramics.jpg',
//                               // widget.product.images,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Text(
//                             'Ceramic Dining Set',
//                             // widget.product.title,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'Bajey ko Ceramics',
//                             // widget.product.seller,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Colors.red,
//                             ),
//                           ),
//                           Text(
//                             "Rs 3000",
//                             // ('\$' '${widget.product.price}'),
//                             style: const TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       // Icon(
//                       //   Icons.favorite_border_outlined,
//                       //   color: GlobalVariables.redColor,
//                       // ),
//                       Column(
//                         children: [
//                           SizedBox(
//                             height: 130,
//                             width: 130,
//                             child: Image.asset(
//                               'assets/images/arts.jpg',
//                               // widget.product.images,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Text(
//                             'Goddess Chamunda ',
//                             // widget.product.title,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'Everest Thangka Shop',
//                             // widget.product.seller,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Colors.red,
//                             ),
//                           ),
//                           Text(
//                             "Rs 10,000",
//                             // ('\$' '${widget.product.price}'),
//                             style: const TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       // Icon(
//                       //   Icons.favorite_border_outlined,
//                       //   color: GlobalVariables.redColor,
//                       // )
//                     ],
//                   ),
//                 ),
//               ),
              
//             ]),
//           ],
//         ),
//       ),
    
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//             backgroundColor: Colors.red,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//             backgroundColor: Colors.green,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//             backgroundColor: Colors.purple,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//             backgroundColor: Colors.pink,
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
      
//     );
//   }
// }