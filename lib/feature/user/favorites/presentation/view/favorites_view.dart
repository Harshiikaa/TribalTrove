import 'package:TribalTrove/feature/seller/product/presentation/view_model/product_view_model.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/state/favorite_state.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/view_model/favorite_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    final favoriteState = ref.watch(favoriteViewModelProvider);
    List<FavoriteEntity?>? favorites = favoriteState.favorites;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Your Favorites')),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          favoriteState.isLoading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: favorites.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // arguments passed to show on the product details page
                          Navigator.pushNamed(context, "/productDetails",
                              arguments: [
                                favorites[index]?.favoriteID,
                                favorites[index]?.productID,
                                favorites[index]?.userID,
                                favorites[index]?.createdAt,
                              ]);
                        },
                        child: Container(
                          height: 220, // Set the desired height
                          width: double
                              .infinity, // Set the desired width, use double.infinity for full width
                          child: Card(
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 80, // Adjust the image height
                                    child: Image.network(""
                                        // favorites?[index]!.productID ?? '',
                                        // fit: BoxFit.cover,
                                        ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${favorites[index]?.createdAt}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  // Text(
                                  //   'NPR.${products?[index]?.productPrice}',
                                  //   style: TextStyle(
                                  //     fontSize: 16,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle remove from favorites action
                },
                child: Text('Remove from Favorites'),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Handle remove from favorites with trash can icon
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
  // body: favorites.isEmpty
  //     ? Center(
  //         child: Text('No favorites yet.'),
  //       )
  //     : ListView.builder(
  //         itemCount: favorites.length,
  //         itemBuilder: (context, index) {
  //           return Card(
  //             margin: EdgeInsets.all(10),
  //             child: ListTile(
  //               leading: Image.network(
  //                 favorites[index].image,
  //                 width: 80,
  //                 height: 80,
  //                 fit: BoxFit.cover,
  //               ),
  //               title: Text(favorites[index].title),
  //               subtitle: Text(
  //                   'Price: \$${favorites[index].price.toStringAsFixed(2)}'),
  //               trailing: IconButton(
  //                 icon: Icon(Icons.delete),
  //                 onPressed: () {
  //                   // Handle remove action
  //                   setState(() {
  //                     favorites.removeAt(index);
  //                   });
  //                 },
  //               ),
  //             ),
  //           );
  //         },
  //       ),
}
