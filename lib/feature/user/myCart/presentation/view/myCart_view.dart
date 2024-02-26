import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';
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
  @override
  Widget build(BuildContext context) {
    final myCartState = ref.watch(myCartViewModelProvider);
    List<MyCartEntity?>? cart = myCartState.cart;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        centerTitle: true,
        // leading: true,
      ),
      body: Column(
        children: [
          myCartState.isLoading
              ? const CircularProgressIndicator()
              :
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // itemCount: cart.length ?? 0,
              itemBuilder: (context, index) {
                Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
              
                );
              }),
        ],
      ),
    );
  }
}
