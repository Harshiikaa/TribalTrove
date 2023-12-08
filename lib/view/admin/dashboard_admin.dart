import 'package:flutter/material.dart';

class Dashboard_adminScreen extends StatefulWidget {
  const Dashboard_adminScreen({super.key});

  @override
  State<Dashboard_adminScreen> createState() => _Dashboard_adminScreenState();
}

class _Dashboard_adminScreenState extends State<Dashboard_adminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard"),),
      body: Column(),
    );

  }
}