import 'package:TribalTrove/core/common/snackbar/snackbar.dart';
import 'package:TribalTrove/feature/seller/product/presentation/view_model/product_view_model.dart';
import 'package:TribalTrove/feature/seller/seller_dashboard/presentation/view_model/seller_dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SellerDashboardView extends ConsumerStatefulWidget {
  const SellerDashboardView({super.key});

  @override
  ConsumerState<SellerDashboardView> createState() =>
      _SellerDashboardViewState();
}

class _SellerDashboardViewState extends ConsumerState<SellerDashboardView> {
  @override
  Widget build(BuildContext context) {
    final sellerDashboardState = ref.watch(sellerDashboardViewModelProvider);
    return Scaffold(
      body: sellerDashboardState.lstWidgets[sellerDashboardState.index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Set the background color to blue
        selectedItemColor: Colors.white, // Set the selected item color
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: sellerDashboardState.index,
        onTap: (index) {
          ref
              .read(sellerDashboardViewModelProvider.notifier)
              .changeIndex(index);
        },
      ),
    );
  }
}
