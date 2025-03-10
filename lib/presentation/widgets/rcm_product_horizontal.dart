import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';

class RecommendedProductHoriz extends StatelessWidget {
  final String? title;
  final bool? isShowMore;
  final List data;
  RecommendedProductHoriz({super.key, required this.data, this.title, this.isShowMore = true});


  final List<Map<String, String>> lst = [
    {
      'id': 'asdasd213sasd',
      'productName': 'Turtleneck Sweater',
      'price': '34.99',
      'cover':
      'https://www.shutterstock.com/image-photo/young-fashion-model-stylish-beige-600nw-2382157791.jpg'
    },
    {
      'id': 'asdasd213sasd1',
      'productName': 'Long Sleeve Dress',
      'price': '9.99',
      'cover':
      'https://www.shutterstock.com/image-photo/young-black-woman-cream-suit-600nw-2491218847.jpg'
    },
    {
      'id': 'asdasd213sasd2',
      'productName': 'Sportwear Set',
      'price': '11.99',
      'cover':
      'https://www.ukmodels.co.uk/wp-content/uploads/2015/08/shutterstock_267639224.jpg'
    },
    {
      'id': 'asdasd213sasd3',
      'productName': 'Lihua Tunic White',
      'price': '64.99',
      'cover':
      'https://i.pinimg.com/564x/c1/04/d8/c104d875cc230ffea6b961f75e9563df.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Căn trái toàn bộ nội dung
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
              16.0, 0.0, 16.0, 12.0), // Giảm padding dưới
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title ?? '-',
                style:
                const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: lst.asMap().entries.map((item) {
              final int index = item.key; // Chỉ số của item
              final Map<String, String> json = item.value; // Dữ liệu của item
              final bool isLastItem =
                  index == lst.length - 1; // Kiểm tra item cuối

              return Padding(
                padding: EdgeInsets.only(
                  right: isLastItem
                      ? 0
                      : 24.0, // Item cuối right = 0, còn lại right = 24.0
                ), // Khoảng cách giữa các item
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(GColors.whiteColor),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 66,
                        height: 66,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          child: Image.network(
                            json['cover'] ?? '',
                            fit: BoxFit.cover, // Đảm bảo ảnh vừa khung
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                  Icons.error); // Hiển thị khi lỗi tải ảnh
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0), // Khoảng cách giữa ảnh và tên
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4.0, 8.0, 12.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              json['productName'] ?? '',
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '\$${json['price'] ?? ''}',
                              style: const TextStyle(
                                  color: Color(GColors.blackColor),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
