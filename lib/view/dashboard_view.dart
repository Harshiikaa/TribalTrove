import 'package:app/view/constants/global_variables.dart';
import 'package:app/view/user/carousel_view.dart';
import 'package:app/view/user/recommended_view.dart';
import 'package:app/view/user/searchbox_view.dart';
import 'package:app/view/user/top_categories_view.dart';
import 'package:flutter/material.dart';

class DashboardPageUser extends StatefulWidget {
  const DashboardPageUser({super.key});

  @override
  State<DashboardPageUser> createState() => _DashboardPageUserState();
}

class _DashboardPageUserState extends State<DashboardPageUser> {
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

              // Filled icon button
              // IconButton.filled(
              //     onPressed: () {}, icon: const Icon(Icons.filter_drama)),

              // // Filled tonal icon button
              // IconButton.filledTonal(
              //     onPressed: () {}, icon: const Icon(Icons.filter_drama)),

              // // Outlined icon button
              // IconButton.outlined(
              //     onPressed: () {}, icon: const Icon(Icons.filter_drama)),

              // Expanded(
              //   child: Container(
              //     height: 42,
              //     margin: const EdgeInsets.only(left: 15),
              //     child: Material(
              //       borderRadius: BorderRadius.circular(7),
              //       elevation: 1,
              //       child: TextFormField(
              //         // onFieldSubmitted: navigateToSearchScreen,
              //         decoration: InputDecoration(
              //           prefixIcon: InkWell(
              //             onTap: () {},
              //             child: const Padding(
              //               padding: EdgeInsets.only(
              //                 left: 6,
              //               ),
              //               child: Icon(
              //                 Icons.search,
              //                 color: Colors.black,
              //                 size: 23,
              //               ),
              //             ),
              //           ),
              //           filled: true,
              //           fillColor: Colors.white,
              //           contentPadding: const EdgeInsets.only(top: 10),
              //           border: const OutlineInputBorder(
              //             borderRadius: BorderRadius.all(
              //               Radius.circular(7),
              //             ),
              //             borderSide: BorderSide.none,
              //           ),
              //           enabledBorder: const OutlineInputBorder(
              //             borderRadius: BorderRadius.all(
              //               Radius.circular(7),
              //             ),
              //             borderSide: BorderSide(
              //               color: Colors.black38,
              //               width: 1,
              //             ),
              //           ),
              //           hintText: 'Search',
              //           hintStyle: const TextStyle(
              //             fontWeight: FontWeight.w500,
              //             fontSize: 17,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   color: Colors.transparent,
              //   height: 42,
              //   margin: const EdgeInsets.symmetric(horizontal: 10),
              //   child: const Icon(Icons.mic, color: Colors.black, size: 25),
              // ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
