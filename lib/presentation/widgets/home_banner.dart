import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';

class HomeBanner extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  HomeBanner({super.key, required this.data});

  final List<Map<String, dynamic>> lst = [
    {
      'id': 1,
      'title': 'New Collection',
      'content': 'Hang out\n & party',
      'cover':
          'https://static.vecteezy.com/system/resources/thumbnails/044/846/920/small/portrait-girl-looking-away-blonde-dressed-in-striped-shirt-fashion-concept-on-isolated-transparent-background-free-png.png'
    },
    {
      'id': 2,
      'title': 'Summer Collection',
      'content': 'Hang out\n & party',
      'cover':
          'https://static.vecteezy.com/system/resources/thumbnails/034/028/820/small/fashion-model-girl-in-beige-wear-png.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 32.0),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              // enlargeFactor: 0.5,
              height: 200.0, // Chiều cao cố định của carousel
              enlargeCenterPage: true,
              // autoPlay: true,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              // onPageChanged: (index, reason) {
              //   setState(() {
              //     _currentIndex = index;
              //   });
              // },
            ),
            items: lst.map((item) {
              return SizedBox(
                width: MediaQuery.of(context).size.width, // Giới hạn chiều rộng
                child: Stack(
                  // mainAxisSize: MainAxisSize.min, // Giới hạn chiều cao của Column
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration:
                          BoxDecoration(color: Color(GColors.primaryLight)),
                      child: Image.network(item['cover']),
                    ),
                    Positioned(
                        top: 24.0,
                        left: 32.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item['title'].toString().toUpperCase(),
                              style: TextStyle(
                                  color: Color(GColors.blackGrayColor),
                                  fontSize: 16),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              item['content'].toString().toUpperCase(),
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ))
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
