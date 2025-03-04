import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';

class TopCollections extends StatelessWidget {
  final String? title;
  final bool? isShowMore;
  final List data;

  TopCollections(
      {super.key, required this.data, this.title, this.isShowMore = true});

  final Map<String, dynamic> firstCollection = {
    'id': 1,
    'title': 'Sale up to 99%',
    'content': 'For slim \n&beauty',
    'image':
        'https://static.vecteezy.com/system/resources/thumbnails/053/647/117/small/an-elegant-image-of-a-girl-adorned-in-a-kimono-style-robe-surrounded-by-beautiful-flora-perfect-for-cultural-events-and-fashion-displays-png.png'
  };

  final Map<String, dynamic> secondCollection = {
    'id': 1,
    'title': 'Summer Collection 2025',
    'content': 'Most sexy\n & fabulous design',
    'image':
        'https://static.vecteezy.com/system/resources/previews/046/822/632/non_2x/a-businesswoman-in-a-sharp-outfit-isolated-on-a-transparent-background-png.png'
  };

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(
            16.0, 24.0, 16.0, 12.0), // Giảm padding dưới
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? '-',
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            isShowMore!
                ? Text(
                    'Show all',
                    style: TextStyle(
                        color: Color(GColors.blackGrayColor), fontSize: 16),
                  )
                : Container(),
          ],
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      // First Collection
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width, // Giới hạn chiều rộng
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topRight,
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(GColors.primaryLight2),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Image.network(firstCollection['image']),
              ),
              Positioned(
                  top: 24.0,
                  left: 32.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '| ${firstCollection['title']}',
                        style: TextStyle(
                            color: Color(GColors.blackGrayColor), fontSize: 16),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        firstCollection['content'].toString().toUpperCase(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      //
      SizedBox(
        height: 16.0,
      ),
      // Second Collection
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width, // Giới hạn chiều rộng
          child: Stack(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(GColors.primaryLight2),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Image.network(secondCollection['image']),
              ),
              Positioned(
                  top: 24.0,
                  left: 32.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '| ${secondCollection['title']}',
                        style: TextStyle(
                            color: Color(GColors.blackGrayColor), fontSize: 16),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        secondCollection['content'].toString().toUpperCase(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      //
    ]);
  }
}
