import 'package:TribalTrove/feature/seller/order/presentation/view/seller_order_view.dart';
import 'package:TribalTrove/feature/seller/product/presentation/view/seller_product_view.dart';
import 'package:TribalTrove/feature/seller/profile/presentation/view/seller_profile_view.dart';
import 'package:TribalTrove/feature/seller/seller_dashboard/presentation/view/bottom_view/dashboard_view.dart';
import 'package:TribalTrove/feature/seller/seller_dashboard/presentation/view/seller_dashboard_view.dart';
import 'package:flutter/material.dart';

class SellerDashboardState {
  final int index;
  final List<Widget> lstWidgets;

  SellerDashboardState({required this.index, required this.lstWidgets});

  SellerDashboardState.initialState()
      : index = 0,
        lstWidgets = [
          const DashboardView(),
          SellerProductView(),
          const SellerOrderView(),
          const SellerProfileView(),
        ];
  // CopyWith function to change the index no
  SellerDashboardState copyWith({
    int? index,
  }) {
    return SellerDashboardState(
      index: index ?? this.index,
      lstWidgets: lstWidgets,
    );
  }
}
