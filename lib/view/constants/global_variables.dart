import 'package:TribalTrove/model/product_model.dart';
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
  // static const Color pagecolor = Color(0xFFE5E5E5);
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
    'assets/images/carousel.png',
    // 'https://m.media-amazon.com/images/I/71pp-m6QwfL._AC_UF894,1000_QL80_.jpg',
    // 'https://nafanepal.org/wp-content/uploads/2015/03/Prajnaparamita.jpg',
  ];

  // static List<Product> allProducts = [
  //   Product(
  //       id: 1,
  //       seller: 'Apple',
  //       title: 'iPhone 9',
  //       price: 549,
  //       images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
  //   Product(
  //       id: 2,
  //       seller: 'Apple',
  //       title: 'iPhone 10',
  //       price: 459,
  //       images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
  //   Product(
  //       id: 1,
  //       seller: 'Apple',
  //       title: 'iPhone 9',
  //       price: 549,
  //       images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
  //   Product(
  //       id: 2,
  //       seller: 'Apple',
  //       title: 'iPhone 10',
  //       price: 459,
  //       images: 'https://i.dummyjson.com/data/products/2/1.jpg')
  // ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Decors',
      'image': 'assets/images/homeDecors.jpg',
    },
    {
      'title': 'Clothes',
      'image': 'assets/images/clothes.jpg',
    },
    {
      'title': 'Accessories',
      'image': 'assets/images/accessories.jpg',
    },
    {
      'title': 'Ceramics',
      'image': 'assets/images/ceramics.jpg',
    },
    {
      'title': 'Arts',
      'image': 'assets/images/arts.jpg',
    },
    // {
    //   'title': 'Embroidery',
    //   'image': 'assets/images/embroidery.jpg',
    // },
    // {
    //   'title': 'Fine Arts',
    //   'image': 'assets/images/embroidery.jpg',
    // },
    // {
    //   'title': 'Candles',
    //   'image': 'assets/images/embroidery.jpg',
    // },
    // {
    //   'title': 'Earrings',
    //   'image': 'assets/images/embroidery.jpg',
    // },
    // {
    //   'title': 'Souveniers',
    //   'image': 'assets/images/embroidery.jpg',
    // },
    // {
    //   'title': 'Metal Art',
    //   'image': 'assets/images/embroidery.jpg',
    // },
    // {
    //   'title': 'Embroidery',
    //   'image': 'assets/images/embroidery.jpg',
    // },
    // {
    //   'title': 'Embroidery',
    //   'image': 'assets/images/embroidery.jpg',
    // },
  ];
}
