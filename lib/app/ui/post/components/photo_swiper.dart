import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'package:enft/app/constant/constant.dart';

class PhotoSwiper extends StatelessWidget {
  const PhotoSwiper({required this.photos});

  final List<File> photos;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          height: 300,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                'http://' + photos[index].path,
                fit: BoxFit.contain,
              );
            },
            itemCount: photos.length,
            pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                  size: 10.0,
                  activeSize: 14.0,
                  color: Colors.white,
                  activeColor: kPrimaryColor),
            ),
          )),
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding * 2),
          child: BackButton(
            color: Colors.white,
            onPressed: () => Get.back(),
          )),
    ]);
  }
}
