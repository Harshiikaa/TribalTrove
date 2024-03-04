import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/view_model/get_cart_view_model.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/view_model/cart_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartView extends ConsumerStatefulWidget {
  const CartView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartViewState();
}

class _CartViewState extends ConsumerState<CartView> {
  final ScrollController _scrollController = ScrollController();
  late List<CartEntity> cartList;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // ref.read(getCartViewModelProvider.notifier).getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartViewModelProvider);
    final cartsState = ref.watch(getCartViewModelProvider);
    print('cartState: ${cartState.cart}');
    cartList = cartsState.cart;

    return Scaffold(
      appBar: AppBar(
        // Customize app bar color
        title: const Text(
          'Cart List',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification) {
                  if (_scrollController.position.extentAfter == 0) {
                    ref.read(getCartViewModelProvider.notifier).getCart();
                  }
                }
                return true;
              },
              child: RefreshIndicator(
                color: Colors.green, // Customize refresh indicator color
                backgroundColor: Colors.amberAccent,
                onRefresh: () async {
                  ref.read(cartViewModelProvider.notifier).resetMessage();
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: cartList.length ?? 0,
                  itemBuilder: (context, index) {
                    final cart = cartList[index];
                    final userID = cartList[index].userID;
                    final productID = cartList[index].productID;
                    final cartID = cartList[index].cartID as String;
                    final createdAt = cartList[index].createdAt;
                    final quantity = cartList[index].quantity;

                    final cartEntity = CartEntity(
                        cartID: cartID,
                        productID: productID,
                        quantity: quantity,
                        createdAt: createdAt);
                    // return Card(
                    //   elevation: 3,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: ListTile(
                    //     contentPadding: const EdgeInsets.all(15),
                    //     leading: Image.network(
                    //       productID?['plantImageUrl'],
                    //       width: 100,
                    //       height: 100,
                    //       fit: BoxFit.cover,
                    //     ),
                    //     title: Text(
                    //       cart.productID?['ProductsName'] as String,
                    //       style: const TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     trailing: IconButton(
                    //       icon: const Icon(
                    //         Icons.delete,
                    //         color: Colors.red, // Customize favorite icon color
                    //       ),
                    //       onPressed: () {
                    //         ref
                    //             .read(getCartViewModelProvider.notifier)
                    //             .removeFromCart(cartEntity);
                    //       },
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ),
            ),
          ),
          if (cartState.isLoading)
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
