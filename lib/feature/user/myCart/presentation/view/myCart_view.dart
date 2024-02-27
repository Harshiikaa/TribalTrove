import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/view_model/get_cart_view_model.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/view_model/myCart_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCartView extends ConsumerStatefulWidget {
  const MyCartView({super.key});

  @override
  ConsumerState<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends ConsumerState<MyCartView> {
    final ScrollController scrollController = ScrollController();

 @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final myCartState = ref.watch(myCartViewModelProvider);
    // List<MyCartEntity?>? cart = myCartState.cart;

    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.teal,
        // automaticallyImplyLeading: false,
        title: const Text(
          'My Cart List',
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
                        .read(getCartViewModelProvider.notifier)
                        .getCart();
                  }
                }
                return true;
              },
              child: RefreshIndicator(
                color: Colors.green, // Customize refresh indicator color
                backgroundColor: Colors.amberAccent,
                onRefresh: () async {
                  ref.read(myCartViewModelProvider.notifier).resetMessage();
                },
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: myCartState.cart.length,
                  itemBuilder: (context, index) {
                    final cart = myCartState.cart[index];
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        title: Text(
                          cart.productID!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red, // Customize favorite icon color
                          ),
                          onPressed: () {
                            ref
                                .read(getCartViewModelProvider.notifier)
                                .removeFromCart(cart);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          if (myCartState.isLoading)
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
