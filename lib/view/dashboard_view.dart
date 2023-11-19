import 'package:TribalTrove/model/product_model.dart';
import 'package:TribalTrove/view/constants/global_variables.dart';
import 'package:TribalTrove/view/user/carousel_view.dart';
import 'package:TribalTrove/view/user/productItem_view.dart';
import 'package:TribalTrove/view/user/productList_view.dart';
import 'package:TribalTrove/view/user/searchbox_view.dart';
import 'package:TribalTrove/view/user/top_categories_view.dart';
import 'package:TribalTrove/widgets/product_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashboardPageUser extends StatefulWidget {
  const DashboardPageUser({super.key});

  @override
  State<DashboardPageUser> createState() => _DashboardPageUserState();
}

class _DashboardPageUserState extends State<DashboardPageUser> {
  void navigateToCategoryPage(BuildContext context, String category) {
    // Navigator.pushNamed(context, CategoryDealsScreen.routeName,
    //     arguments: category);
  }

  _buildAllProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: GlobalVariables.allProducts.length,
        itemBuilder: (context, index) {
          final allProducts = GlobalVariables.allProducts[index];
          return ProductCard(product: allProducts);
        },
      );

  static final TextEditingController _searchController =
      TextEditingController();
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
                      TextStyle(fontSize: 18, color: GlobalVariables.greyColor),
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
          SizedBox(height: 10),
          SizedBox(
            height: 60,
            child: ListView.builder(
              itemCount: GlobalVariables.categoryImages.length,
              scrollDirection: Axis.horizontal,
              itemExtent: 75,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => navigateToCategoryPage(
                    context,
                    GlobalVariables.categoryImages[index]['title']!,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            GlobalVariables.categoryImages[index]['image']!,
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                      Text(
                        GlobalVariables.categoryImages[index]['title']!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          CarouselSlider(
            items: GlobalVariables.carouselImages.map(
              (i) {
                return Builder(
                  builder: (BuildContext context) => Image.asset(
                    i,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                );
              },
            ).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              height: 200,
            ),
          ),
          SizedBox(
            height: 10,
          ),
         
        ],
      ),
    );
  }
}
