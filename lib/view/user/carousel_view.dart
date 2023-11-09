import 'package:app/view/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CaraouselImages extends StatefulWidget {
  const CaraouselImages({super.key});

  @override
  State<CaraouselImages> createState() => _CaraouselImagesState();
}

class _CaraouselImagesState extends State<CaraouselImages> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => Image.network(
              i,
              fit: BoxFit.cover,
              height: 200,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
