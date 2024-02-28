import 'package:flutter/material.dart';

class Jewelry extends StatefulWidget {
  const Jewelry({super.key});

  @override
  State<Jewelry> createState() => _JewelryState();
}

class _JewelryState extends State<Jewelry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jewelry')),
    );
  }
}
