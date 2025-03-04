import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class IntroduceScreen extends StatefulWidget {
  IntroduceScreen({super.key});

  @override
  State<IntroduceScreen> createState() => _IntroduceScreenState();
}

class _IntroduceScreenState extends State<IntroduceScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> imgList = [
    {
      'id': 1,
      'title': 'Discover something new',
      'description': 'Special new arrivals just for you',
      'image': 'assets/images/model1.png',
    },
    {
      'id': 2,
      'title': 'Update trendy outfit',
      'description': 'Favorite brands and hottest trends',
      'image': 'assets/images/model2.png',
    },
    {
      'id': 3,
      'title': 'Explore your true style',
      'description': 'Relax and let us bring the style to you',
      'image': 'assets/images/model3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0, // Đặt xuống cuối màn hình
            left: 0,
            right: 0,
            child: Container(
              color: Color(GColors.blackSlideColor),
              width: MediaQuery.of(context).size.width,
              height: 340,
            ),
          ),
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeFactor: 0.5,
                height: 550.0,
                enlargeCenterPage: true,
                // autoPlay: true,
                aspectRatio: 16 / 9,
                // viewportFraction: 0.78,
                enableInfiniteScroll: false, // Dừng lặp vô tận
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: imgList.map((item) {
                return Column(
                  children: [
                    Text(
                      item['title'],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(GColors.blackColor),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      item['description'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(GColors.blackColor),
                      ),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(GColors.grayColor),
                            borderRadius: BorderRadius.circular(16)),
                        child: Image.asset(
                          item['image'],
                          // fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.7,
                        ),
                      ),
                    )
                  ],
                );
              }).toList(),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width / 3.5,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    // onTap: () => setState(() {
                    //   // _currentIndex = entry.key;
                    // }),
                    child: Container(
                      width: _currentIndex == entry.key ? 12.0 : 8.0,
                      height: _currentIndex == entry.key ? 12.0 : 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == entry.key
                            ? Color(GColors
                                .occupiedColor) // Màu đậm cho trang hiện tại
                            : Color(
                                GColors.grayColor), // Màu nhạt cho trang khác
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  context.go(AppRoutes.signup);
                },
                style: ElevatedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  foregroundColor: Colors.transparent,
                  elevation: 0,
                  backgroundColor:
                      Color(GColors.blackGrayColor).withOpacity(0.8),
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32), // Bo góc
                    side: BorderSide(
                      color: Color(GColors.whiteColor), // Màu viền trắng
                      width: 1, // Độ dày viền
                    ),
                  ),
                ),
                child: Text('Get Started',
                    style: TextStyle(
                        color: Color(GColors.whiteColor),
                        fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
