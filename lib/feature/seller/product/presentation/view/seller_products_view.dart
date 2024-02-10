import 'package:TribalTrove/core/common/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SellerAddProductView extends ConsumerWidget{
  SellerAddProductView({super.key});

  final gap = const SizedBox(height: 8);
  final productController = TextEditingController();

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
                'Add Batch',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            TextFormField(
              controller: productController,
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
                  // BatchEntity batch =
                  //     BatchEntity(batchName: batchController.text);
                  // ref.read(batchViewModelProvider.notifier).addBatch(batch);
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
            batchState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: batchState.batches.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            batchState.batches[index].batchName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            batchState.batches[index].batchId ?? 'No id',
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
