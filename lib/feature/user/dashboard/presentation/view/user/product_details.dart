import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:TribalTrove/feature/seller/product/presentation/view_model/product_view_model.dart';
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
    final productState = ref.watch(productViewModelProvider);
    List<ProductEntity?>? products = productState.products;
    final args = ModalRoute.of(context)!.settings.arguments as List<String?>;
    // final id = args[0];
    final productName = args[0] ?? 'productName';
    final productPrice = args[1] ?? 'productPrice';
    final productDescription = args[2] ?? 'productDescription';
    final productCategory = args[3] ?? 'productCategory';
    final productImageURL = args[4];
    'productImage';
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
              productDescription,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            // Price

            // Buttons - Favorite and Add to Cart
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     // Favorite Button
            //     IconButton(
            //       icon: Icon(
            //         isFavorite ? Icons.favorite : Icons.favorite_border,
            //         color: isFavorite ? Colors.red : null,
            //       ),
            //       onPressed: () {
            //         // Toggle the favorite status or handle the favorite action
            //         setState(() {
            //           isFavorite = !isFavorite;
            //         });
            //       },
            //     ),
            //     Text(
            //       isFavorite ? 'Remove from Favorite' : 'Add to Favorite',
            //       style: TextStyle(fontSize: 12),
            //     ),
            //     // Add to Cart Button
            //     ElevatedButton(
            //       onPressed: () {},
            //       child: Text(isInCart ? 'Remove from Cart' : 'Add to Cart'),
            //     ),
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Favorite Button
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                      ),
                      onPressed: () {
                        // Toggle the favorite status or handle the favorite action
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                    Text(
                      isFavorite ? 'Remove from Favorite' : 'Add to Favorite',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                // Cart Button
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        isInCart
                            ? Icons.remove_shopping_cart
                            : Icons.add_shopping_cart,
                        // color: Colors.blue,
                      ),
                      onPressed: () {
                        // Toggle the cart status or handle the cart action
                        setState(() {
                          isInCart = !isInCart;
                        });
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
          ],
        ),
      ),
    );
  }
}
