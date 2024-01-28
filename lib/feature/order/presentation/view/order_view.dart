import 'package:TribalTrove/feature/dashboard/presentation/view/dashboard_view_user.dart';
import 'package:flutter/material.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
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
