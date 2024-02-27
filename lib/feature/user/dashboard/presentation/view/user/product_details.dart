import 'package:TribalTrove/core/common/provider/internet_connectivity.dart';
import 'package:TribalTrove/core/common/snackbar/snackbar.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:TribalTrove/feature/seller/product/presentation/view_model/product_view_model.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/view_model/favorite_view_model.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/view_model/myCart_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailsView extends ConsumerStatefulWidget {
  const ProductDetailsView({super.key});

  @override
  ConsumerState<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends ConsumerState<ProductDetailsView> {
  bool isFavorite = false;
  bool isInCart = false;
  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(connectivityStatusProvider);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (isConnected == ConnectivityStatus.isDisconnected) {
    //     showSnackBar(
    //         message: 'No Internet Connection',
    //         context: context,
    //         color: Colors.red);
    //   } else if (isConnected == ConnectivityStatus.isConnected) {
    //     showSnackBar(message: 'You are online', context: context);
    //   }

    //   if (ref.watch(favoriteViewModelProvider).showMessage!) {
    //     showSnackBar(
    //         message: 'Favorite created Successfully', context: context);
    //     // ref.read(favoriteViewModelProvider.notifier).resetMessage();
    //   }
    // });
// for cart
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isConnected == ConnectivityStatus.isDisconnected) {
        showSnackBar(
            message: 'No Internet Connection',
            context: context,
            color: Colors.red);
      } else if (isConnected == ConnectivityStatus.isConnected) {
        showSnackBar(message: 'You are online', context: context);
      }

      if (ref.watch(myCartViewModelProvider).showMessage!) {
        showSnackBar(
            message: 'Added to My Cart Successfully', context: context);
        // ref.read(myCartViewModelProvider.notifier).resetMessage();
      }
    });

    final productState = ref.watch(productViewModelProvider);
    List<ProductEntity?>? products = productState.products;
    final args = ModalRoute.of(context)!.settings.arguments as List<String?>;
    final productID = args[0] ?? 'productID';
    final productName = args[1] ?? 'productName';
    final productPrice = args[2] ?? 'productPrice';
    final productDescription = args[3] ?? 'productDescription';
    final productCategory = args[4] ?? 'productCategory';
    final productImageURL = args[5];
    'productImage';

    final favoriteState = ref.watch(favoriteViewModelProvider);
    final myCartState = ref.watch(myCartViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(productImageURL!),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Product Details
            Text(
              productName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'NPR.${productPrice}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              productCategory,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              productDescription,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            // Price

            // Buttons - Favorite and Add to Cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Favorite Button
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: () async {
                    final data =
                        await ref.read(userSharedPrefsProvider).getUser();

                    String? id = data?['_id']?.toString() ?? '';
                    final now = DateTime.now();
                    final currentDate = DateTime(now.year, now.month, now.day);
                    final entity = FavoriteEntity(
                        createdAt: currentDate,
                        productID: productID,
                        userID: id);
                    // print('ENTITY: $entity');
                    ref
                        .read(favoriteViewModelProvider.notifier)
                        .createFavorite(entity);
                  },
                  // {
                  //   // Toggle the favorite status or handle the favorite action
                  //   setState(() {
                  //     isFavorite = !isFavorite;
                  //   }

                  //   );
                  // },
                ),
                Text(
                  isFavorite ? 'Remove from Favorite' : 'Add to Favorite',
                  style: TextStyle(fontSize: 12),
                ),
                // Add to Cart Button
                IconButton(
                  icon: Icon(
                    isInCart
                        ? Icons.remove_shopping_cart
                        : Icons.add_shopping_cart,
                    // color: Colors.blue,
                  ),
                  onPressed: () async {
                    final data =
                        await ref.read(userSharedPrefsProvider).getUser();
                    String? id = data?['_id']?.toString() ?? '';
                    final now = DateTime.now();
                    final currentDate = DateTime(now.year, now.month, now.day);
                    final entity = MyCartEntity(
                      createdAt: currentDate,
                      productID: productID,
                      userID: id,
                      quantity: 1,
                    );
                    ref
                        .read(myCartViewModelProvider.notifier)
                        .addToCart(entity);
                  },

                  // {
                  //   // Toggle the cart status or handle the cart action

                  //   setState(() {
                  //     isInCart = !isInCart;
                  //   });
                  // },
                ),
                Text(
                  isInCart ? 'Remove from Cart' : 'Add to Cart',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     // Favorite Button
            //     Column(
            //       children: [
            //         // IconButton(
            //         //   icon: Icon(
            //         //     isFavorite ? Icons.favorite : Icons.favorite_border,
            //         //     color: isFavorite ? Colors.red : null,
            //         //   ),
            //         //   onPressed: () {
            //         //     // Toggle the favorite status or handle the favorite action
            //         //     setState(() {
            //         //       isFavorite = !isFavorite;
            //         //     });
            //         //   },
            //         // ),
            //         // Text(
            //         //   isFavorite ? 'Remove from Favorite' : 'Add to Favorite',
            //         //   style: TextStyle(fontSize: 12),
            //         // ),
            //       ],
            //     ),
            //     // Cart Button
            //     Column(
            //       children: [
            //         IconButton(
            //           icon: Icon(
            //             isFavorite ? Icons.favorite : Icons.favorite_border,
            //             color: isFavorite ? Colors.red : null,
            //           ),
            //           onPressed: () async {
            //             final now = DateTime.now();
            //             final currentDate =
            //                 DateTime(now.year, now.month, now.day);
            //             final entity = FavoriteEntity(
            //                 createdAt: currentDate,
            //                 productID: productID,
            //                 userID: "user");
            //             ref
            //                 .read(favoriteViewModelProvider.notifier)
            //                 .createFavorite(entity)
            //                 ;
            //           },
            //         ),

            //         IconButton(
            //           icon: Icon(
            //             isInCart
            //                 ? Icons.remove_shopping_cart
            //                 : Icons.add_shopping_cart,
            //             // color: Colors.blue,
            //           ),
            //           onPressed: () {
            //             // Toggle the cart status or handle the cart action
            //             setState(() {
            //               isInCart = !isInCart;
            //             });
            //           },
            //         ),
            //         Text(
            //           isInCart ? 'Remove from Cart' : 'Add to Cart',
            //           style: TextStyle(fontSize: 12),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
