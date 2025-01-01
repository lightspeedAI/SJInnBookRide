import 'package:book_a_ride/constants/styles.dart';
import 'package:book_a_ride/models/car.dart';
import 'package:book_a_ride/widgets/net_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BookRide extends StatelessWidget {
  Car selectedCar;
  BookRide({super.key, required this.selectedCar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: pageBgCol,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              CarouselSlider(
                  items: [
                    NetImage(
                      imgUrl: selectedCar.image1,
                    ),
                    NetImage(
                      imgUrl: selectedCar.image2,
                    ),
                    NetImage(
                      imgUrl: selectedCar.image3,
                    ),
                  ],
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ))
            ],
          ),
        ),
        //   ],
        // ),
      ),
    );
  }
}
