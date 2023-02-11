import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../widgets/image_holder.dart';

Widget itemImages(List<String> image) {
  if (image.isEmpty) {
    return Container(
      height: 200.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.0),
        child: imageHolder(null),
      ),
    );
  }
  List<Widget> items = [];
  for (int i = 0; i < image.length; i++) {
    items.add(imageHolder(image[i]));
  }
  return CarouselSlider(
      items: items,
      options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: false));
}
