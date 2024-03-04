import 'dart:developer';

import 'package:TribalTrove/core/common/provider/internet_connectivity.dart';
import 'package:TribalTrove/core/common/snackbar/snackbar.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isConnected == ConnectivityStatus.isDisconnected) {
        showSnackBar(
            message: 'No Internet Connection',
            context: context,
            color: Colors.red);
      } else if (isConnected == ConnectivityStatus.isConnected) {
        showSnackBar(message: 'You are online', context: context);
      }

      if (ref.watch(myCartViewModelProvider).showMessage) {
        showSnackBar(
            message: 'Added to My Cart Successfully', context: context);
      }
    });

    final args = ModalRoute.of(context)!.settings.arguments as List<String?>;

    log('args: $args', name: 'ProductDetailsView');

    final productID = args[0] ?? 'productID';
    final productName = args[1] ?? 'productName';
    final productPrice = args[2] ?? 'productPrice';
    final productDescription = args[3] ?? 'productDescription';
    final productCategory = args[4] ?? 'productCategory';
    final productImageURL = args[5];
    'productImage';

    final ProductAPIModel productEntity = ProductAPIModel(
      productID: productID,
      productName: productName,
      productPrice: int.parse(productPrice),
      productDescription: productDescription,
      productCategory: productCategory,
      productImageURL: productImageURL,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                      productID: productEntity,
                      userID: id,
                    );

                    ref
                        .read(favoriteViewModelProvider.notifier)
                        .createFavorite(entity);
                  },
                ),
                Text(
                  isFavorite ? 'Remove from Favorite' : 'Add to Favorite',
                  style: TextStyle(fontSize: 12),
                ),
                IconButton(
                  icon: Icon(
                    isInCart
                        ? Icons.remove_shopping_cart
                        : Icons.add_shopping_cart,
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
                ),
                Text(
                  isInCart ? 'Remove from Cart' : 'Add to Cart',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
