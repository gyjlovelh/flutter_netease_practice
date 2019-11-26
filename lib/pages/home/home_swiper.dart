import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatefulWidget {
  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: new Dio().get('http://106.14.154.205:3000/banner', queryParameters: {"type": 2}),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {

          List banners = json.decode(snapshot.data.toString())['banners'];
          // 
          double swiperHeight = MediaQuery.of(context).size.width * 0.905 * 0.4;
          return Container(
            height: swiperHeight,
            width: double.infinity,
            child: new Swiper(
              itemBuilder: (context, index) {
                final item = banners[index];
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("${item['pic']}"),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                );
              },
              scale: 0.8,
              viewportFraction: 0.905,
              autoplayDelay: 5000,
              autoplay: true,
              duration: 1000,
              outer: false,
              loop: true,
              itemCount: banners.length,
              layout: SwiperLayout.DEFAULT,
              pagination: new SwiperPagination(),
              control: new SwiperControl(
                iconPrevious: null,
                iconNext: null
              ),
              onTap: (int index) {},
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      }
    );
  }
}
