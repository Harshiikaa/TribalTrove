import 'package:TribalTrove/feature/seller/product/presentation/view_model/product_view_model.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorite_entity.dart';
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
  late List<FavoritesEntity> favoriteList;

  @override
  void initState() {
    ref.read(getFavoriteViewModelProvider.notifier).getFavorite();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteState = ref.watch(favoriteViewModelProvider);
    final favoritesState = ref.watch(getFavoriteViewModelProvider);
    favoriteList = favoritesState.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite List',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          // Add a refresh button to the app bar
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.black,
            onPressed: () {
              ref.read(getFavoriteViewModelProvider.notifier).getFavorite();
            },
          ),
        ],
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
                color: Colors.green,
                backgroundColor: Colors.amberAccent,
                onRefresh: () async {
                  ref.read(favoriteViewModelProvider.notifier).resetMessage();
                },
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: favoriteList.length,
                  itemBuilder: (context, index) {
                    final favorite = favoriteList[index];
                    final productID = favorite.productID;
                    final favoriteID = favorite.favoriteID;
                    final userID = favorite.userID;
                    final createdAt = favorite.createdAt;
                    final favoriteEntity = FavoriteEntity(
                      favoriteID: favoriteID,
                      userID: userID,
                      productID: productID?['_id'] as String,
                      createdAt: createdAt,
                    );
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        leading: Image.network(
                          productID?['productImageURL'] as String,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          favorite.productID?['productName'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'NPR.${favorite.productID?['productPrice']}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            ref
                                .read(favoriteViewModelProvider.notifier)
                                .removeFavorite(favoriteEntity);
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
  }
}


// class FavoritesViewState extends ConsumerState<FavoritesView> {
//   final ScrollController scrollController = ScrollController();
//   late List<FavoritesEntity> favoriteList;

//   @override
//   void initState() {
//     ref.read(getFavoriteViewModelProvider.notifier).getFavorite();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final favoriteState = ref.watch(favoriteViewModelProvider);
//     final favoritesState = ref.watch(getFavoriteViewModelProvider);
//     favoriteList = favoritesState.favorites;
//     print('FavoritesViewState - Building widget');
//     print('FavoritesViewState - Initial Favorite List: $favoriteList');

//     // List<FavoriteEntity?>? favorites = favoriteState.favorites;
//     return Scaffold(
//       appBar: AppBar(
//         // backgroundColor: Colors.teal, // Customize app bar color
//         title: const Text(
//           'Favorite List',
//           style: TextStyle(
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: NotificationListener(
//               onNotification: (notification) {
//                 if (notification is ScrollEndNotification) {
//                   print('Scroll End Notification Received');

//                   if (scrollController.position.extentAfter == 0) {
//                     ref
//                         .read(getFavoriteViewModelProvider.notifier)
//                         .getFavorite();
//                   }
//                 }
//                 return true;
//               },
//               child: RefreshIndicator(
//                 color: Colors.green, // Customize refresh indicator color
//                 backgroundColor: Colors.amberAccent,
//                 onRefresh: () async {
//                   ref.read(favoriteViewModelProvider.notifier).resetMessage();
//                 },
//                 child: ListView.builder(
//                   controller: scrollController,
//                   itemCount: favoriteList.length,
//                   itemBuilder: (context, index) {
//                      print('Building item $index');
//                     final favorite = favoriteList[index];
//                     final productID = favorite.productID;
//                     final favoriteID = favorite.favoriteID;
//                     final userID = favorite.userID;
//                     final createdAt = favorite.createdAt;
//                     final favoriteEntity = FavoriteEntity(
//                       favoriteID: favoriteID,
//                       userID: userID,
//                       productID: productID?['_id'] as String,
//                       createdAt: createdAt,
//                     );
//                     return Card(
//                       elevation: 3,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: ListTile(
//                         contentPadding: const EdgeInsets.all(15),
//                         leading: Image.network(
//                           productID?['productImageURL'] as String,
//                           width: 80,
//                           height: 80,
//                           fit: BoxFit.cover,
//                         ),
//                         title: Text(
//                           favorite.productID?['productName'],
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: Text(
//                           'NPR.${favorite.productID?['productPrice']}',
//                           style: const TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                         trailing: IconButton(
//                           icon: const Icon(
//                             Icons.delete,
//                             color: Colors.red, // Customize favorite icon color
//                           ),
//                           onPressed: () {
//                             ref
//                                 .read(favoriteViewModelProvider.notifier)
//                                 .removeFavorite(favoriteEntity);
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//           if (favoriteState.isLoading)
//             Container(
//               padding: const EdgeInsets.all(10),
//               alignment: Alignment.center,
//               child: const CircularProgressIndicator(color: Colors.red),
//             ),
//         ],
//       ),
//     );
//   }
// }


