import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class ProductListDetails extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  ProductListDetails({super.key, required this.data});

  final List<Map<String, dynamic>> sample = [
    {
      'id': 1,
      'productName': 'Linen Dress',
      'price': '52.00',
      'priceOriginal': '80.00',
      'numOfStar': 4,
      'totalReview': 82,
      'image':
          'https://www.shutterstock.com/image-photo/young-fashion-model-stylish-beige-600nw-2382157791.jpg'
    },
    {
      'id': 2,
      'productName': 'Fitted Waist Dress',
      'price': '32.00',
      'priceOriginal': '48.00',
      'numOfStar': 3,
      'totalReview': 12,
      'image':
          'https://www.projectcece.com/static/_versions/blogs/model_wearing_sustainable_clothing_large.jpg'
    },
    {
      'id': 3,
      'productName': 'Front Tie Mini Dress',
      'price': '82.00',
      'priceOriginal': '60.00',
      'numOfStar': 5,
      'totalReview': 102,
      'image':
          'https://www.tomjames.com/pics/catalog/2024SP/pics/Tom-James-Spring-2024-Womens-54.jpg'
    },
    {
      'id': 1,
      'productName': 'Linen Dress',
      'price': '52.00',
      'priceOriginal': '80.00',
      'numOfStar': 4,
      'totalReview': 82,
      'image':
          'https://www.shutterstock.com/image-photo/young-fashion-model-stylish-beige-600nw-2382157791.jpg'
    },
    {
      'id': 2,
      'productName': 'Fitted Waist Dress',
      'price': '32.00',
      'priceOriginal': '48.00',
      'numOfStar': 3,
      'totalReview': 12,
      'image':
          'https://www.projectcece.com/static/_versions/blogs/model_wearing_sustainable_clothing_large.jpg'
    },
    {
      'id': 3,
      'productName': 'Front Tie Mini Dress',
      'price': '82.00',
      'priceOriginal': '60.00',
      'numOfStar': 5,
      'totalReview': 102,
      'image':
          'https://www.tomjames.com/pics/catalog/2024SP/pics/Tom-James-Spring-2024-Womens-54.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 24,
        childAspectRatio: 0.55,
      ),
      itemCount: data.isNotEmpty ? data.length : sample.length,
      itemBuilder: (context, index) {
        final product = data.isNotEmpty ? data[index] : sample[index];
        return GestureDetector(
          onTap: () {
            context.push(AppRoutes.productDetails,
                extra: {'image': product['image']});
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                // Sử dụng Expanded để hình ảnh lấp đầy không gian
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.network(
                    width: double.infinity,
                    product['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              16.height,
              Text(
                product['productName'],
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: <Widget>[
                  Text(
                    product['price'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  8.width,
                  Stack(
                    children: [
                      Text(
                        '\$${product['priceOriginal']}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey, // Text color
                        ),
                      ),
                      Positioned(
                        top: 10.0, // Adjust to align with text middle
                        child: Container(
                          height: 1.0, // Thickness of the line
                          width: _getTextWidth(
                              '\$${product['priceOriginal']}', 14),
                          color: Colors.grey, // Custom line color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              8.height,
              Row(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (starIndex) => Icon(
                        Icons.star,
                        size: 16,
                        color: starIndex < product['numOfStar']
                            ? Color(GColors.greenColor)
                            : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '(${product['totalReview']})',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper function to estimate text width
  double _getTextWidth(String text, double fontSize) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: TextStyle(fontSize: fontSize)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width;
  }
}
