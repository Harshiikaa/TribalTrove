import 'package:flutter/material.dart';

class GlobalVariables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const Color primaryColor = Color(0xFF1C1C1C);
  static const Color secondaryColor = Color(0xFF505050);
  static const Color tertiaryColor = Color(0xff2B4360);

  static const backgroundColor = Colors.white;
  static const Color greyColor = Color(0xFF8B96A5);
  static const Color outlineColor = Color(0xffDEE2E7);
  static const Color selectBackgroundColor = Color(0xffE5F1FF);
  static const Color greyBackgroundColor = Color(0xFFF7FAFC);
  static const Color blueButtonLinear1 = Color(0xff127FFF);
  static const Color blueButtonLinear2 = Color(0xff0067FF);
  static const Color blueTextColor = Color(0xff066FFF);
  static const Color fullStarColor = Color(0xffFF9017);
  static const Color emptyStarColor = Color(0xffD4CDC5);
  static const Color greenColor = Color(0xff00B517);
  static const Color redColor = Color(0xffFF8585);
  static const Color logoColor = Color(0xff123058);

  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://res.cloudinary.com/practicaldev/image/fetch/s--MZvaMEOV--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/qll2w5atklv13ljmqope.png',
    'https://res.cloudinary.com/practicaldev/image/fetch/s--MZvaMEOV--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/qll2w5atklv13ljmqope.png',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Home Decor',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Clothes',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Accessories',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': '',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];
}
