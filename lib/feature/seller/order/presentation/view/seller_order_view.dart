import 'package:TribalTrove/feature/user/dashboard/presentation/view/dashboard_view_user.dart';
import 'package:flutter/material.dart';

class SellerOrderView extends StatefulWidget {
  const SellerOrderView({super.key});

  @override
  State<SellerOrderView> createState() => _SellerOrderViewState();
}

class _SellerOrderViewState extends State<SellerOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // Navigate back when the back button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardViewUser()),
            );
          },
        ),
      ),
    );
  }
}
