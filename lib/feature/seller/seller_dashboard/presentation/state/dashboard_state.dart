import 'package:TribalTrove/feature/seller/seller_dashboard/presentation/view/seller_dashboard_view.dart';
import 'package:flutter/material.dart';

class SellerDashboardState {
  final int index;
  final List<Widget> lstWidgets;

  SellerDashboardState({required this.index, required this.lstWidgets});

  SellerDashboardState.initialState()
      : index = 0,
        lstWidgets = [
          const SellerDashboardView(),
          AddCourseView(),
          AddBatchView(),
          const ProfileView(),
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
