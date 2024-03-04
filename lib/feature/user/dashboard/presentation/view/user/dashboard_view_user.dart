import 'dart:async';

import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/core/common/provider/is_dark_theme.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:TribalTrove/feature/seller/product/presentation/view_model/product_view_model.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view_model/auth_viewmodel.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/product_details.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/widgets/bottom_navigation_widget.dart';
import 'package:TribalTrove/config/constants/global_variables.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/carousel_view.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/view/favorites_view.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/view/cart_view.dart';
import 'package:TribalTrove/feature/user/searchProduct/presentation/view/searchbox_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/widgets/product_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardViewUser extends ConsumerStatefulWidget {
  // final Product product;

  const DashboardViewUser({super.key});

  @override
  ConsumerState<DashboardViewUser> createState() => _DashboardPageUserState();
}

class _DashboardPageUserState extends ConsumerState<DashboardViewUser> {
  late bool isDark = false;

  late StreamSubscription<ProximityEvent> _proximityEvent;
  @override
  void initState() {
    isDark = ref.read(isDarkThemeProvider);
    super.initState();
    _proximityEvent = proximityEvents!.listen((ProximityEvent event) async {
      if (event.proximity < 2) {
        showLogoutConfirmationDialog(context);
      }
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      ' ',
      style: optionStyle,
    ),
    Text(
      ' ',
      style: optionStyle,
    ),
    Text(
      ' ',
      style: optionStyle,
    ),
    Text(
      ' ',
      style: optionStyle,
    ),
  ];

// Helper function to build a responsive product column
  // Widget _buildProductColumn(
  //   String imagePath,
  //   String title,
  //   String seller,
  //   String price,
  // ) {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height: MediaQuery.of(context).size.width > 600 ? 220 : 150,
  //         width: MediaQuery.of(context).size.width > 600 ? 220 : 150,
  //         child: Image.asset(
  //           imagePath,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       Text(
  //         title,
  //         style: TextStyle(
  //           fontSize: MediaQuery.of(context).size.width > 600 ? 24 : 18,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       Text(
  //         seller,
  //         style: TextStyle(
  //           fontSize: MediaQuery.of(context).size.width > 600 ? 20 : 16,
  //           color: Colors.red,
  //         ),
  //       ),
  //       Text(
  //         price,
  //         style: TextStyle(
  //           fontSize: MediaQuery.of(context).size.width > 600 ? 26 : 20,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  void navigateToCategoryPage(BuildContext context, String category) {
    // Navigator.pushNamed(context, CategoryDealsScreen.routeName,
    //     arguments: category);
  }

  static final TextEditingController _searchController =
      TextEditingController();
  void navigateToSearchScreen(String query) {}

  Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false); // No
              },
              child: Text(
                'No'
              ),
            ),
            TextButton(
              onPressed: () async {
                // Remove the token when user clicks Yes
                final userSharedPrefs = UserSharedPrefs();
                final result = await userSharedPrefs.deleteUserToken();

                result.fold(
                  (failure) {
                    // Handle failure
                    print("Failed to remove token: ${failure.error}");
                  },
                  (success) {
                    // Token removed successfully
                    print("Token removed successfully");
                    // Navigate to the login page
                    Navigator.pushReplacementNamed(context, '/loginPage');
                  },
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  String selectedFilter = 'Sort by Minimum Price';
  List<String> filterOptions = [
    'Sort by Minimum Price',
    'Sort by Maximum Price'
  ];

  // Function to handle search
  void onSearch(String query) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final List<bool> isFavoriteList = List.generate(5, (index) => false);

    final productState = ref.watch(productViewModelProvider);
    List<ProductEntity?>? products = productState.products;

    final dashboardState = ref.watch(dashboardViewModelProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(80), // Increased height for the AppBar
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(),
          ),
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                height: 150, // Increased height for the logo
                width: 220, // Increased width for the logo
              ),
              Spacer(), // Expands the space between the logo and icons
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartView()),
                        );
                      },
                      iconSize: 30, // Increased icon size for the shopping cart
                    ),
                    Switch(
                        value: isDark,
                        onChanged: (value) {
                          setState(() {
                            isDark = value;
                            ref
                                .read(isDarkThemeProvider.notifier)
                                .updateTheme(value);
                          });
                        }),
                    IconButton(
                      icon: const Icon(Icons.logout_outlined),
                      onPressed: () {
                        showLogoutConfirmationDialog(context);
                      },
                      iconSize: 30, // Increased icon size for the person icon
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                style: TextStyle(fontSize: 18.0),
                onChanged: onSearch,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Search',
                  contentPadding: const EdgeInsets.all(12.0),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear, size: 24.0),
                      color: GlobalVariables.greyColor,
                      onPressed: () {
                        _searchController.clear();
                        ref
                            .read(productViewModelProvider.notifier)
                            .getAllProducts();
                      }),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search, size: 24.0),
                    color: GlobalVariables.greyColor,
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: GlobalVariables.outlineColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.01, // Increased for responsiveness
            ),

            // SizedBox(
            //   height: 60,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: List.generate(
            //       GlobalVariables.categoryImages.length,
            //       (index) {
            //         double itemSize = MediaQuery.of(context).size.width *
            //             0.08; // Adjusted for responsiveness

            //         return GestureDetector(
            //           onTap: () {
            //             // Use the Navigator to navigate to the desired page for each category
            //             switch (index) {
            //               case 0:
            //                 Navigator.pushNamed(context, "/decor");
            //                 break;
            //               case 1:
            //                 Navigator.pushNamed(context, "/categoryPage2");
            //                 break;
            //               case 2:
            //                 Navigator.pushNamed(context, "/categoryPage2");
            //                 break;
            //               case 3:
            //                 Navigator.pushNamed(context, "/categoryPage2");
            //                 break;
            //               case 4:
            //                 Navigator.pushNamed(context, "/categoryPage2");
            //                 break;
            //               // Add cases for other categories as needed
            //               default:
            //                 break;
            //             }
            //           },
            //           child: Column(
            //             children: [
            //               Container(
            //                 padding: EdgeInsets.symmetric(
            //                     horizontal: itemSize * 0.2),
            //                 child: ClipRRect(
            //                   borderRadius:
            //                       BorderRadius.circular(itemSize * 0.5),
            //                   child: Image.asset(
            //                     GlobalVariables.categoryImages[index]['image']!,
            //                     fit: BoxFit.cover,
            //                     height: itemSize,
            //                     width: itemSize,
            //                   ),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 8, // Increased gap between category items
            //               ),
            //               Text(
            //                 GlobalVariables.categoryImages[index]['title']!,
            //                 style: TextStyle(
            //                   fontSize: MediaQuery.of(context).size.width *
            //                       0.03, // Adjusted for responsiveness
            //                   fontWeight: FontWeight.w400,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),

            // SizedBox(
            //   height: 80, // Increase the height for text
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: List.generate(
            //         GlobalVariables.categoryImages.length,
            //         (index) {
            //           double itemSize = MediaQuery.of(context).size.width *
            //               0.1; // Adjusted for responsiveness and increased size

            //           return GestureDetector(
            //             onTap: () {
            //               // Use the Navigator to navigate to the desired page for each category
            //               switch (index) {
            //                 case 0:
            //                   Navigator.pushNamed(context, "/jewelry");
            //                   break;
            //                 case 1:
            //                   Navigator.pushNamed(context, "/categoryPage2");
            //                   break;
            //                 case 2:
            //                   Navigator.pushNamed(context, "/categoryPage2");
            //                   break;
            //                 case 3:
            //                   Navigator.pushNamed(context, "/categoryPage2");
            //                   break;
            //                 case 4:
            //                   Navigator.pushNamed(context, "/categoryPage2");
            //                   break;
            //                 // Add cases for other categories as needed
            //                 default:
            //                   break;
            //               }
            //             },
            //             child: Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //               child: Column(
            //                 children: [
            //                   Container(
            //                     padding: EdgeInsets.symmetric(
            //                         horizontal: itemSize * 0.2),
            //                     child: ClipRRect(
            //                       borderRadius:
            //                           BorderRadius.circular(itemSize * 0.5),
            //                       child: Image.asset(
            //                         GlobalVariables.categoryImages[index]
            //                             ['image']!,
            //                         fit: BoxFit.cover,
            //                         height: itemSize,
            //                         width: itemSize,
            //                       ),
            //                     ),
            //                   ),
            //                   SizedBox(
            //                     height:
            //                         8, // Increased gap between category items
            //                   ),
            //                   Container(
            //                     height:
            //                         40, // Set a fixed height for the text container
            //                     child: Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 8.0),
            //                       child: Text(
            //                         GlobalVariables.categoryImages[index]
            //                             ['title']!,
            //                         overflow: TextOverflow.ellipsis,
            //                         maxLines: 2, // Set the desired max lines
            //                         style: TextStyle(
            //                           fontSize:
            //                               MediaQuery.of(context).size.width *
            //                                   0.03,
            //                           fontWeight: FontWeight.w400,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // ),

            // Center(
            //   // child: _widgetOptions.elementAt(_selectedIndex),
            //   child: _widgetOptions.elementAt(dashboardState.index),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.04, // Increased for responsiveness
            ),
            CarouselSlider(
              items: GlobalVariables.carouselImages.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.asset(
                      i,
                      fit: BoxFit.cover,
                      height:
                          MediaQuery.of(context).size.width > 600 ? 400 : 200,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.width > 600 ? 400 : 200,
                viewportFraction:
                    MediaQuery.of(context).size.width > 600 ? 0.8 : 1.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Recommended Items",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width > 600 ? 24 : 20,
              ),
            ),
            DropdownButton<String>(
              value: selectedFilter,
              items: filterOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              // onChanged: (String? newValue) {
              //   if (newValue != null) {
              //     setState(() {
              //       selectedFilter = newValue;
              //       // Perform sorting based on selected option
              //       if (selectedFilter == 'Sort by Minimum Price') {
              //         products.sort((a, b) => (a?.productPrice ?? 0)
              //             .compareTo(b?.productPrice ?? 0));
              //       } else if (selectedFilter == 'Sort by Maximum Price') {
              //         products.sort((a, b) => (b?.productPrice ?? 0)
              //             .compareTo(a?.productPrice ?? 0));
              //       }
              //     });
              //   }
              // },

              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedFilter = newValue;
                    // Perform sorting based on selected option
                    if (selectedFilter == 'Sort by Minimum Price') {
                      products.sort((a, b) =>
                          (double.tryParse(a?.productPrice ?? '') ?? 0.0)
                              .compareTo(
                                  double.tryParse(b?.productPrice ?? '') ??
                                      0.0));
                    } else if (selectedFilter == 'Sort by Maximum Price') {
                      products.sort((a, b) =>
                          (double.tryParse(b?.productPrice ?? '') ?? 0.0)
                              .compareTo(
                                  double.tryParse(a?.productPrice ?? '') ??
                                      0.0));
                    }
                  });
                }
              },
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
              ),
              itemCount: products
                  .where((product) =>
                      _searchController.text.isEmpty ||
                      product!.productName
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase()))
                  .length,
              itemBuilder: (context, index) {
                final filteredProducts = products
                    .where((product) =>
                        _searchController.text.isEmpty ||
                        product!.productName
                            .toLowerCase()
                            .contains(_searchController.text.toLowerCase()))
                    .toList();

                return GestureDetector(
                  onTap: () {
                    // Navigate to the product details page with arguments
                    Navigator.pushNamed(
                      context,
                      "/productDetails",
                      arguments: [
                        filteredProducts[index]?.productID,
                        filteredProducts[index]?.productName,
                        filteredProducts[index]?.productPrice.toString(),
                        filteredProducts[index]?.productDescription,
                        filteredProducts[index]?.productCategory,
                        filteredProducts[index]?.productImageURL,
                      ],
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80, // Adjust the image height
                            child: Image.network(
                              filteredProducts[index]?.productImageURL ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '${filteredProducts[index]?.productName}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'NPR.${filteredProducts[index]?.productPrice}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // : ListView.builder(
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: products.length ?? 0,
            //     itemBuilder: (context, index) {
            //       // Filter products based on search query
            //       if (_searchController.text.isNotEmpty &&
            //           !products[index]!
            //               .productName
            //               .toLowerCase()
            //               .contains(_searchController.text.toLowerCase())) {
            //         return Container();
            //       }
            //       return Card(
            //         margin: EdgeInsets.all(10),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //         child: GestureDetector(
            //           onTap: () {
            //             // arguments passed to show on the product details page
            //             Navigator.pushNamed(context, "/productDetails",
            //                 arguments: [
            //                   products[index]?.productID,
            //                   products[index]?.productName,
            //                   products[index]?.productPrice,
            //                   products[index]?.productDescription,
            //                   products[index]?.productCategory,
            //                   products[index]?.productImageURL,
            //                 ]);
            //           },
            //           child: Container(
            //             height: 220, // Set the desired height
            //             width: double
            //                 .infinity, // Set the desired width, use double.infinity for full width
            //             child: Card(
            //               elevation: 5,
            //               margin: EdgeInsets.all(10),
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10.0),
            //               ),
            //               child: Padding(
            //                 padding: EdgeInsets.all(8.0),
            //                 child: Column(
            //                   children: [
            //                     SizedBox(
            //                       height: 80, // Adjust the image height
            //                       child: Image.network(
            //                         products?[index]!.productImageURL ?? '',
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                     SizedBox(height: 8),
            //                     Text(
            //                       '${products?[index]?.productName}',
            //                       style: TextStyle(
            //                         fontSize: 16,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                     SizedBox(height: 4),
            //                     Text(
            //                       'NPR.${products?[index]?.productPrice}',
            //                       style: TextStyle(
            //                         fontSize: 16,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     }),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       Card(
            //         margin: EdgeInsets.all(10),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //         child: InkWell(
            //           onTap: () {
            //             // Handle onTap action
            //           },
            //           child: Container(
            //             width: 150, // Set a fixed width for each card
            //             height: 200,
            //             child: Column(
            //               children: [

            //                 Expanded(
            //                   flex: 1,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Text(
            //                           'Product Name',
            //                           style: TextStyle(
            //                             fontWeight: FontWeight.bold,
            //                           ),
            //                         ),
            //                         Text('Price: \$100'),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
