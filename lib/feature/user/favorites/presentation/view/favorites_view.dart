import 'package:TribalTrove/feature/seller/product/presentation/view_model/product_view_model.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/state/favorite_state.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/view_model/favorite_view_model.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/view_model/get_favorite_view_model.dart';
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
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteState = ref.watch(getFavoriteViewModelProvider);
    // List<FavoriteEntity?>? favorites = favoriteState.favorites;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // Customize app bar color
        title: const Text(
          'Favorite List',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification) {
                  if (scrollController.position.extentAfter == 0) {
                    ref
                        .read(getFavoriteViewModelProvider.notifier)
                        .getFavorite();
                  }
                }
                return true;
              },
              child: RefreshIndicator(
                color: Colors.green, // Customize refresh indicator color
                backgroundColor: Colors.amberAccent,
                onRefresh: () async {
                  ref.read(favoriteViewModelProvider.notifier).resetMessage();
                },
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: favoriteState.favorites.length,
                  itemBuilder: (context, index) {
                    final favorite = favoriteState.favorites[index];
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        leading: Image.network(
                          favorite.productID?.productImageURL ?? '',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          favorite.productID?.productName ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Price: NPR.${favorite.productID?.productPrice ?? ''}', // Assuming productPrice is available in FavoriteEntity
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red, // Customize favorite icon color
                          ),
                          onPressed: () {
                            ref
                                .read(getFavoriteViewModelProvider.notifier)
                                .removeFavorite(favorite);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          if (favoriteState.isLoading)
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(color: Colors.red),
            ),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Center(child: Text('Your Favorites')),
    //     automaticallyImplyLeading: false,
    //   ),
    //   body: Column(
    //     children: [
    //       favoriteState.isLoading
    //           ? const CircularProgressIndicator()
    //           : ListView.builder(
    //               shrinkWrap: true,
    //               physics: const NeverScrollableScrollPhysics(),
    //               itemCount: favorites.length ?? 0,
    //               itemBuilder: (context, index) {
    //                 return Card(
    //                   margin: EdgeInsets.all(10),
    //                   shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(10.0),
    //                   ),
    //                   child: GestureDetector(
    //                     onTap: () {
    //                       // arguments passed to show on the product details page
    //                       Navigator.pushNamed(context, "/productDetails",
    //                           arguments: [
    //                             favorites[index]?.favoriteID,
    //                             favorites[index]?.productID,
    //                             favorites[index]?.userID,
    //                             favorites[index]?.createdAt,
    //                           ]);
    //                     },
    //                     child: Container(
    //                       height: 220, // Set the desired height
    //                       width: double
    //                           .infinity, // Set the desired width, use double.infinity for full width
    //                       child: Card(
    //                         elevation: 5,
    //                         margin: EdgeInsets.all(10),
    //                         shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(10.0),
    //                         ),
    //                         child: Padding(
    //                           padding: EdgeInsets.all(8.0),
    //                           child: Column(
    //                             children: [
    //                               SizedBox(
    //                                 height: 80, // Adjust the image height
    //                                 child: Image.network(""
    //                                     // favorites?[index]!.productID ?? '',
    //                                     // fit: BoxFit.cover,
    //                                     ),
    //                               ),
    //                               SizedBox(height: 8),
    //                               Text(
    //                                 '${favorites[index]?.createdAt}',
    //                                 style: TextStyle(
    //                                   fontSize: 16,
    //                                   fontWeight: FontWeight.bold,
    //                                 ),
    //                               ),
    //                               SizedBox(height: 4),
    //                               // Text(
    //                               //   'NPR.${products?[index]?.productPrice}',
    //                               //   style: TextStyle(
    //                               //     fontSize: 16,
    //                               //   ),
    //                               // ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               }),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           ElevatedButton(
    //             onPressed: () {
    //               // Handle remove from favorites action
    //             },
    //             child: Text('Remove from Favorites'),
    //           ),
    //           IconButton(
    //             icon: Icon(Icons.delete),
    //             onPressed: () {
    //               // Handle remove from favorites with trash can icon
    //             },
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
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
