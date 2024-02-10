import 'package:TribalTrove/feature/user/categories/presentation/view/categories_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/widgets/bottom_navigation_widget.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/favorites_view.dart';
import 'package:TribalTrove/config/constants/global_variables.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/carousel_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/productItem_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/productList_view.dart';
import 'package:TribalTrove/feature/user/searchProduct/presentation/view/searchbox_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/top_categories_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/widgets/product_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardViewUser extends ConsumerStatefulWidget {
  // final Product product;

  const DashboardViewUser({super.key});

  @override
  ConsumerState<DashboardViewUser> createState() => _DashboardPageUserState();
}

class _DashboardPageUserState extends ConsumerState<DashboardViewUser> {
  int _selectedIndex = 0;
  List<Widget> listScreens = [
    const DashboardViewUser(),
    CategoriesView(),
    FavoritesView(),
  ];
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
  Widget _buildProductColumn(
    String imagePath,
    String title,
    String seller,
    String price,
  ) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width > 600 ? 220 : 150,
          width: MediaQuery.of(context).size.width > 600 ? 220 : 150,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width > 600 ? 24 : 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          seller,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width > 600 ? 20 : 16,
            color: Colors.red,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width > 600 ? 26 : 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void navigateToCategoryPage(BuildContext context, String category) {
    // Navigator.pushNamed(context, CategoryDealsScreen.routeName,
    //     arguments: category);
  }

  static final TextEditingController _searchController =
      TextEditingController();
  void navigateToSearchScreen(String query) {
    // Navigator.pushNamed(context,, arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardViewModelProvider);
    // final favoriteState = ref.watch(favoriteViewModelProvider);
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
                        // Handle shopping cart action
                      },
                      iconSize: 30, // Increased icon size for the shopping cart
                    ),
                    IconButton(
                      icon: const Icon(Icons.person_outline),
                      onPressed: () {
                        // Handle person icon action
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(fontSize: 18.0), // Increased font size
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Search',
                    contentPadding: const EdgeInsets.all(12.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear, size: 24.0),
                      color: GlobalVariables.greyColor,
                      onPressed: () => _searchController.clear(),
                    ),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search, size: 24.0),
                      color: GlobalVariables.greyColor,
                      onPressed: () {
                        // Perform the search here
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: GlobalVariables.outlineColor),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.01, // Increased for responsiveness
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Added for spacing
                children: List.generate(
                  GlobalVariables.categoryImages.length,
                  (index) {
                    double itemSize = MediaQuery.of(context).size.width *
                        0.08; // Adjusted for responsiveness

                    return GestureDetector(
                      onTap: () => navigateToCategoryPage(
                        context,
                        GlobalVariables.categoryImages[index]['title']!,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: itemSize * 0.2),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(itemSize * 0.5),
                              child: Image.asset(
                                GlobalVariables.categoryImages[index]['image']!,
                                fit: BoxFit.cover,
                                height: itemSize,
                                width: itemSize,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8, // Increased gap between category items
                          ),
                          Text(
                            GlobalVariables.categoryImages[index]['title']!,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width *
                                  0.03, // Adjusted for responsiveness
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Center(
              // child: _widgetOptions.elementAt(_selectedIndex),
                child: _widgetOptions.elementAt(dashboardState.index),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.02, // Increased for responsiveness
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
            Column(children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProductColumn(
                        'assets/images/homeDecors.jpg',
                        'Wooden Statue',
                        'Himalaya Crafts',
                        'Rs 5000',
                      ),
                      _buildProductColumn(
                        'assets/images/clothes.jpg',
                        'Hippie T-shirt',
                        'Shakya Pashmina Store',
                        'Rs 1200',
                      ),
                      // Add more product columns as needed
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 130,
                            width: 130,
                            child: Image.asset(
                              'assets/images/ceramics.jpg',
                              // widget.product.images,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Ceramic Dining Set',
                            // widget.product.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Bajey ko Ceramics',
                            // widget.product.seller,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "Rs 3000",
                            // ('\$' '${widget.product.price}'),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 130,
                            width: 130,
                            child: Image.asset(
                              'assets/images/arts.jpg',
                              // widget.product.images,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Goddess Chamunda ',
                            // widget.product.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Everest Thangka Shop',
                            // widget.product.seller,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "Rs 10,000",
                            // ('\$' '${widget.product.price}'),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 130,
                            width: 130,
                            child: Image.asset(
                              'assets/images/ceramics.jpg',
                              // widget.product.images,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Ceramic Dining Set',
                            // widget.product.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Bajey ko Ceramics',
                            // widget.product.seller,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "Rs 3000",
                            // ('\$' '${widget.product.price}'),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Icon(
                      //   Icons.favorite_border_outlined,
                      //   color: GlobalVariables.redColor,
                      // ),
                      Column(
                        children: [
                          SizedBox(
                            height: 130,
                            width: 130,
                            child: Image.asset(
                              'assets/images/arts.jpg',
                              // widget.product.images,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Goddess Chamunda ',
                            // widget.product.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Everest Thangka Shop',
                            // widget.product.seller,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "Rs 10,000",
                            // ('\$' '${widget.product.price}'),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Icon(
                      //   Icons.favorite_border_outlined,
                      //   color: GlobalVariables.redColor,
                      // )
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
      // bottomNavigationBar:const BottomNavigationWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xffEFF2F4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
            backgroundColor: Color(0xffEFF2F4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            backgroundColor: Color(0xffEFF2F4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard),
            label: 'My Orders',
            backgroundColor: Color(0xffEFF2F4),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: 'Setting',
          //   backgroundColor: Color(0xffEFF2F4),
          // ),
        ],
        // currentIndex: _selectedIndex,
        currentIndex: dashboardState.index,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Color(0xff91B1E7),
        onTap: (index) {
          setState(() {
            // selectedIndex = index;
            ref.read(dashboardViewModelProvider.notifier).changeIndex(index);
          });
        },
      ),
    );
  }
}
