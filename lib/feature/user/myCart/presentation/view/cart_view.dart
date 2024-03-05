// import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
// import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
// import 'package:TribalTrove/feature/user/myCart/domain/entity/carts_entity.dart';
// import 'package:TribalTrove/feature/user/myCart/presentation/view_model/get_cart_view_model.dart';
// import 'package:TribalTrove/feature/user/myCart/presentation/view_model/cart_view_model.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class CartView extends ConsumerStatefulWidget {
//   const CartView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _CartViewState();
// }

// class _CartViewState extends ConsumerState<CartView> {
//   final ScrollController _scrollController = ScrollController();
//   late List<CartsEntity> cartList;

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     // ref.read(getCartViewModelProvider.notifier).getCart();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cartState = ref.watch(cartViewModelProvider);
//     final cartsState = ref.watch(getCartViewModelProvider);
//     print('cartState: ${cartState.cart}');
//     cartList = cartsState.cart;

//     return Scaffold(
//       appBar: AppBar(
//         // Customize app bar color
//         title: const Text(
//           'Cart List',
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: NotificationListener(
//               onNotification: (notification) {
//                 if (notification is ScrollEndNotification) {
//                   if (_scrollController.position.extentAfter == 0) {
//                     ref.read(getCartViewModelProvider.notifier).getCart();
//                   }
//                 }
//                 return true;
//               },
//               child: RefreshIndicator(
//                 color: Colors.green, // Customize refresh indicator color
//                 backgroundColor: Colors.amberAccent,
//                 onRefresh: () async {
//                   ref.read(cartViewModelProvider.notifier).resetMessage();
//                 },
//                 child: ListView.builder(
//                   controller: _scrollController,
//                   itemCount: cartList.length ?? 0,
//                   itemBuilder: (context, index) {
//                     final cart = cartList[index];
//                     // final userID = cartList[index].userID;
//                     final productID = cartList[index].productID;
//                     final cartID = cartList[index].cartID as String;
//                     final createdAt = cartList[index].createdAt;
//                     final quantity = cartList[index].quantity;

//                     final cartEntity = CartEntity(
//                         cartID: cartID,
//                         productID: productID?['_id'] as String,
//                         quantity: quantity,
//                         createdAt: createdAt);
//                     return Card(
//                       elevation: 3,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: ListTile(
//                         contentPadding: const EdgeInsets.all(15),
//                         leading: Image.network(
//                           productID?['productImageURL'] as String,
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.cover,
//                         ),
//                         title: Text(
//                           cart.productID?['productName'] as String,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         trailing: IconButton(
//                           icon: const Icon(
//                             Icons.delete,
//                             color: Colors.red, // Customize favorite icon color
//                           ),
//                           onPressed: () {
//                             ref
//                                 .read(cartViewModelProvider.notifier)
//                                 .removeFromCart(cartEntity);
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//           if (cartState.isLoading)
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
import 'package:TribalTrove/feature/user/dashboard/presentation/view/dashboard_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/dashboard_view_user.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/carts_entity.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/view_model/get_cart_view_model.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartView extends ConsumerStatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  ConsumerState<CartView> createState() => _CartViewState();
}

class _CartViewState extends ConsumerState<CartView> {
  final ScrollController _scrollController = ScrollController();
  late List<CartsEntity> cartList;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartViewModelProvider);
    final cartsState = ref.watch(getCartViewModelProvider);
    cartList = cartsState.cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart List'),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardView()));
          },
        ),
          centerTitle: true,
        actions: [
          // Add a refresh button to the app bar
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.black,
            onPressed: () {
              ref.read(getCartViewModelProvider.notifier).getCart();
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
                  if (_scrollController.position.extentAfter == 0) {
                    ref.read(getCartViewModelProvider.notifier).getCart();
                  }
                }
                return true;
              },
              child: RefreshIndicator(
                color: Colors.green,
                backgroundColor: Colors.amberAccent,
                onRefresh: () async {
                  ref.read(cartViewModelProvider.notifier).resetMessage();
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: cartList.length ?? 0,
                  itemBuilder: (context, index) {
                    return CartItemWidget(cart: cartList[index]);
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
          CheckoutSection(cartList: cartList),
        ],
      ),
    );
  }
}

class CartItemWidget extends ConsumerStatefulWidget {
  final CartsEntity cart;

  const CartItemWidget({Key? key, required this.cart}) : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends ConsumerState<CartItemWidget> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.cart.quantity;
  }

  @override
  Widget build(BuildContext context) {
    final cartEntity = CartEntity(
      cartID: widget.cart.cartID as String,
      productID: widget.cart.productID?['_id'] as String,
      quantity: quantity,
      createdAt: widget.cart.createdAt,
    );

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        leading: Image.network(
          widget.cart.productID?['productImageURL'] as String,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        title: Text(
          widget.cart.productID?['productName'] as String,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              'NPR.${widget.cart.productID?['productPrice']}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                if (quantity > 1) {
                  setState(() {
                    quantity--;
                  });
                }
              },
            ),
            Text(
              quantity.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Add your logic here to check if the quantity can be increased (e.g., up to 5)
                if (quantity < 5) {
                  setState(() {
                    quantity++;
                  });
                }
              },
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            ref.read(cartViewModelProvider.notifier).removeFromCart(cartEntity);
          },
        ),
      ),
    );
  }
}

// class CheckoutSection extends StatelessWidget {
//   const CheckoutSection({Key? key, required this.cartList}) : super(key: key);

//   final List<CartsEntity> cartList;

//   @override
//   Widget build(BuildContext context) {
//     double totalPrice = 0;

//     for (final cart in cartList) {
//       // Placeholder prices; replace with actual product price from your data
//       double productPrice = 25.99;
//       totalPrice += productPrice * cart.quantity;
//     }

//     return Column(
//       children: [
//         const Divider(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Total:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               '\$${totalPrice.toStringAsFixed(2)}',
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: () {
//             // Add your logic for checkout here
//             print('Checkout button pressed!');
//           },
//           child: const Text('Checkout'),
//         ),
//       ],
//     );
//   }
// }

class CheckoutSection extends StatefulWidget {
  const CheckoutSection({Key? key, required this.cartList}) : super(key: key);

  final List<CartsEntity> cartList;

  @override
  _CheckoutSectionState createState() => _CheckoutSectionState();
}

class _CheckoutSectionState extends State<CheckoutSection> {
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    for (final cart in widget.cartList) {
      // Placeholder prices; replace with actual product price from your data
      double productPrice = double.parse(cart.productID?['productPrice']);
      totalPrice += productPrice * cart.quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'NPR${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Add your logic for checkout here
            print('Checkout button pressed!');
          },
          child: const Text('Checkout'),
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant CheckoutSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    calculateTotalPrice();
  }
}
