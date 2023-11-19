import 'package:TribalTrove/view/constants/global_variables.dart';
import 'package:flutter/material.dart';

class SearchBoxView extends StatefulWidget {
  const SearchBoxView({super.key});

  @override
  State<SearchBoxView> createState() => _SearchBoxViewState();
}

class _SearchBoxViewState extends State<SearchBoxView> {
  final TextEditingController _searchController = TextEditingController();
  void navigateToSearchScreen(String query) {
    // Navigator.pushNamed(context,, arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                      borderSide:
                          BorderSide(color: GlobalVariables.outlineColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: GlobalVariables.outlineColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled:
                        true, // Set to true to enable filling the background color
                    // fillColor: GlobalVariables.greyColor,
                    hintText: 'Search',
                    hintStyle: TextStyle(
                        fontSize: 20, color: GlobalVariables.greyColor),
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
    );
  }
}
