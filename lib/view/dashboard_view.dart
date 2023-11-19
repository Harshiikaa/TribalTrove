import 'package:TribalTrove/model/product_model.dart';
import 'package:TribalTrove/view/constants/global_variables.dart';
import 'package:TribalTrove/view/user/carousel_view.dart';
import 'package:TribalTrove/view/user/productItems_view.dart';
import 'package:TribalTrove/view/user/searchbox_view.dart';
import 'package:TribalTrove/view/user/top_categories_view.dart';
import 'package:flutter/material.dart';

class DashboardPageUser extends StatefulWidget {
  const DashboardPageUser({super.key});

  @override
  State<DashboardPageUser> createState() => _DashboardPageUserState();
}

class _DashboardPageUserState extends State<DashboardPageUser> {
  final List<Product> products = [
    Product(
        id: 1,
        brand: 'Apple',
        title: 'iPhone 9',
        price: 549,
        images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
    Product(
        id: 2,
        brand: 'Apple',
        title: 'iPhone 10',
        price: 459,
        images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
    Product(
        id: 1,
        brand: 'Apple',
        title: 'iPhone 9',
        price: 549,
        images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
    Product(
        id: 2,
        brand: 'Apple',
        title: 'iPhone 10',
        price: 459,
        images: 'https://i.dummyjson.com/data/products/2/1.jpg')
  ];
  final TextEditingController _searchController = TextEditingController();
  void navigateToSearchScreen(String query) {
    // Navigator.pushNamed(context,, arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 80,
                width: 160,
              ),
              // IconButton(
              //   // isSelected: ,
              //   icon: const Icon(Icons.settings_outlined),
              //   selectedIcon: const Icon(Icons.settings),
              //   onPressed: null,
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                child: IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {}),
              ),

              IconButton(
                  icon: const Icon(Icons.person_outline), onPressed: () {}),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // Add padding around the search bar
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              // Use a Material design search bar
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: GlobalVariables.outlineColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: GlobalVariables.outlineColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled:
                      true, // Set to true to enable filling the background color
                  // fillColor: GlobalVariables.greyColor,
                  hintText: 'Search',
                  hintStyle:
                      TextStyle(fontSize: 20, color: GlobalVariables.greyColor),
                  fillColor: GlobalVariables.greyBackgroundColor,
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    color: GlobalVariables.greyColor,
                    onPressed: () => _searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: GlobalVariables.greyColor,
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: GlobalVariables.outlineColor)),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                // SearchBoxView(),
                // AddressBox(),
                SizedBox(height: 10),
                TopCategories(),
                SizedBox(height: 10),
                CaraouselImages(),
                SizedBox(height: 10),

                // RecommendedItems(),
                Text(
                  'Recommended Items',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.73,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2),
                      children: [
                        ...List.generate(
                          products.length,
                          (index) => ProductItem(product: products[index]),
                        )
                      ],
                    ),
                  ),
                ),
                // bottomNavigationBar: const CustomBottomNavigationBar(
                //   currentIndex: 0,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
