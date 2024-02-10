import 'package:TribalTrove/core/common/snackbar/snackbar.dart';
import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:TribalTrove/feature/seller/product/presentation/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SellerProductsView extends ConsumerWidget {
  SellerProductsView({super.key});

  final gap = const SizedBox(height: 8);
  final productNameController = TextEditingController();
  // final productPriceController = TextEditingController();
  // final productCategoryController = TextEditingController();
  // final productDescriptionController = TextEditingController();
  // final productImageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productViewModelProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (productState.showMessage) {
        showSnackBar(message: 'Product Added', context: context);
        ref.read(productViewModelProvider.notifier).resetMessage(false);
      }
    });
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            gap,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Add Product',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            TextFormField(
              controller: productNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Product Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter product';
                }
                return null;
              },
            ),
            gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ProductEntity product = ProductEntity(
                    productName: productNameController.text,
                    productPrice: "123",
                    productCategory: 'Ram',
                    productDescription: 'hhehhe',
                  );
                  ref
                      .read(productViewModelProvider.notifier)
                      .createProduct(product);
                },
                child: const Text('Add Batch'),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'List of Products',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            productState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: productState.products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            productState.products[index].productName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            productState.products[index].productID ?? 'No id',
                            style: const TextStyle(
                              color: Colors.indigo,
                              fontSize: 12,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // ref
                              //     .read(batchViewModelProvider.notifier)
                              //     .deleteBatch(
                              //         batchState.batches[index].batchId);
                            },
                          ),
                        );
                      },
                    ),
                  ),
            // batchState.showMessage
            //     ? showSnackBar(message: 'Batch Added', context: context)
            //     : Container(),
          ],
        ),
      ),
    );
  }
}
