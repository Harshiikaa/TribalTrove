import 'dart:io';

import 'package:TribalTrove/core/common/snackbar/snackbar.dart';
import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:TribalTrove/feature/seller/product/presentation/view_model/product_view_model.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view_model/auth_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class SellerProductView extends ConsumerStatefulWidget {
  const SellerProductView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SellerProductViewState();
}

class _SellerProductViewState extends ConsumerState<SellerProductView> {
  final gap = const SizedBox(height: 8);
  final _key = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productCategoryController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _productImageController = TextEditingController();

  File? _img;
  Future _browseImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        _img = File(image.path);
        ref.read(authViewModelProvider.notifier).uploadImage(_img!);
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productViewModelProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (productState.showMessage) {
        showSnackBar(message: 'Product Added', context: context);
        ref.read(productViewModelProvider.notifier).resetMessage(false);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _key,
            child: Column(children: [
              gap,
              TextFormField(
                controller: _productNameController,
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
              TextFormField(
                controller: _productNameController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Product Price',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter product Price';
                  }
                  return null;
                },
              ),
              gap,
              //  DropdownButtonFormField(
              //   value: selectedCategory,
              //   onChanged: (newValue) {
              //     setState(() {
              //       selectedCategory = newValue as String;
              //     });
              //   },
              //   items: [
              //     'Category 1',
              //     'Category 2',
              //     'Category 3',
              //     // Add more categories as needed
              //   ].map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(),
              //     hintText: 'Product Category',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please select a product category';
              //     }
              //     return null;
              //   },
              // ),
              // ],
              gap,
              TextFormField(
                controller: _productNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Product Description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter product';
                  }
                  return null;
                },
              ),
              gap,

              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.grey[300],
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              checkCameraPermission();
                              _browseImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.camera),
                            label: const Text('Camera'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              _browseImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.image),
                            label: const Text('Gallery'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text('Upload Image'),
              ),

              SizedBox(
                height: 200,
                width: 200,
                child: _img != null
                    ? Image.file(
                        _img!,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.grey[
                            200], // Set a background color for the rectangle.
                        child: const Center(
                          child: Text('No Image'),
                        ),
                      ),
              ),
              gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ProductEntity product = ProductEntity(
                      productName: _productNameController.text,
                      productPrice: _productPriceController.text,
                      productCategory: _productCategoryController.text,
                      productDescription: _productDescriptionController.text,
                    );
                    ref
                        .read(productViewModelProvider.notifier)
                        .createProduct(product);
                  },
                  child: const Text('Add Product'),
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
            ]),
          ),
        ),
      ),
    );
  }
}