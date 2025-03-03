import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';

class HomeSlideImage extends StatefulWidget {
  const HomeSlideImage({super.key});

  @override
  State<HomeSlideImage> createState() => _HomeSlideImageState();
}

class _HomeSlideImageState extends State<HomeSlideImage> {
  final List<Map<String, dynamic>> imgList = [
    {
      'id': 1,
      'title': 'Discover\n something new',
      'description': 'Special new arrivals just for you',
      'image':
          'https://t3.ftcdn.net/jpg/03/33/81/02/360_F_333810258_5gP2SBYroH0jtgAtI2ANibRRDe2YY7dU.jpg',
    },
    {
      'id': 2,
      'title': 'Update trendy\n outfit',
      'description': 'Favorite brands and hottest trends',
      'image':
          'https://t3.ftcdn.net/jpg/03/33/81/02/360_F_333810258_5gP2SBYroH0jtgAtI2ANibRRDe2YY7dU.jpg',
    },
    {
      'id': 3,
      'title': 'Explore your\n true style',
      'description': 'Relax and let us bring the style to you',
      'image':
          'https://t3.ftcdn.net/jpg/03/33/81/02/360_F_333810258_5gP2SBYroH0jtgAtI2ANibRRDe2YY7dU.jpg',
    },
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8.0,
      ),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              enlargeFactor: 0.5,
              height: 200.0, // Chiều cao cố định của carousel
              enlargeCenterPage: true,
              // autoPlay: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: imgList.map((item) {
              return SizedBox(
                width: MediaQuery.of(context).size.width, // Giới hạn chiều rộng
                child: Stack(
                  // mainAxisSize: MainAxisSize.min, // Giới hạn chiều cao của Column
                  children: [
                    Expanded(
                      // Dùng Expanded để ảnh chiếm toàn bộ không gian khả dụng
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Image.network(
                          item['image'],
                          fit: BoxFit.cover, // Đảm bảo ảnh fit trong không gian
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 12,
                      child: Text(item['title'],
                          style: TextStyle(
                              color: Color(GColors.whiteColor),
                              fontWeight: FontWeight.bold,
                              fontSize: 28)),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Positioned(
            bottom: 16,
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
                      width: _currentIndex == entry.key ? 10.0 : 6.0,
                      height: _currentIndex == entry.key ? 10.0 : 6.0,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: _currentIndex == entry.key
                            ? Color(GColors
                                .primaryColor) // Màu đậm cho trang hiện tại
                            : Color(
                                GColors.grayColor), // Màu nhạt cho trang khác
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
