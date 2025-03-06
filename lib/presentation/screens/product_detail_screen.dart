import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/presentation/widgets/product_list_horizontal.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<Map<String, dynamic>> arrColor = [
    {'id': 1, 'color': 0xFFff0000},
    {'id': 2, 'color': 0xFFfff000},
    {'id': 3, 'color': 0xFFAEE100},
  ];
  final List<Map<String, dynamic>> arrSizes = [
    {'id': 1, 'name': 'S'},
    {'id': 2, 'name': 'M'},
    {'id': 3, 'name': 'L'},
  ];

  final List<Map<String, dynamic>> arrStarRate = [
    {'id': 1, 'ratio': 40},
    {'id': 2, 'ratio': 20},
    {'id': 3, 'ratio': 10},
    {'id': 4, 'ratio': 25},
    {'id': 5, 'ratio': 5},
  ];

  int selectedSizeId = 3; // Default to L
  int selectedColorId = 3; // Default to L

  @override
  Widget build(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final extraData = state.extra as Map<String, dynamic>?;

    return Scaffold(
      body: Stack(
        children: [
          // Image as the background
          Image.network(
            extraData?['image'] ?? 'https://via.placeholder.com/500',
            // Default image if null
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          // GAppBar at the top
          GAppBar(
            bgColor: Colors.transparent,
            actions: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(GColors.whiteColor),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    color: Color(GColors.redColor),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          // Scrollable content
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 0,
            right: 0,
            bottom: 0,
            // Đảm bảo nó kéo dài đến đáy màn hình
            child: Container(
              // padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(GColors.whiteColor),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 100),
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          16.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Sportwear Set',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(GColors.blackColor),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Row(
                                        children: List.generate(
                                          5,
                                          (starIndex) => Icon(
                                            CupertinoIcons.star_circle_fill,
                                            size: 16,
                                            color: starIndex < 3
                                                ? Color(GColors.greenColor)
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '(129)',
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                '\$89.00',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(GColors.blackColor),
                                ),
                              ),
                            ],
                          ),
                          16.height,
                          Divider(color: Color(GColors.grayColor)),
                          16.height,
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Colors',
                                      style: TextStyle(
                                          color: Color(GColors.blackGrayColor),
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: arrColor.map((colorItem) {
                                        return Container(
                                          margin: EdgeInsets.only(right: 16),
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: Color(colorItem['color']),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 1,
                                                blurRadius: 8,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                              48.height,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Sizes',
                                      style: TextStyle(
                                          color: Color(GColors.blackGrayColor),
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: arrSizes.map((sizeItem) {
                                        final isSelected =
                                            sizeItem['id'] == selectedSizeId;
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedSizeId = sizeItem['id'];
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 16),
                                            width: 32,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? Color(0xFF333333)
                                                  : Color(0xFFF5F5F5),
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  spreadRadius: 1,
                                                  blurRadius: 8,
                                                  offset: Offset(0, 1),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                sizeItem['name'],
                                                style: TextStyle(
                                                  color: isSelected
                                                      ? Color(
                                                          GColors.whiteColor)
                                                      : Color(GColors
                                                          .blackGrayColor),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          24.height,
                          Divider(color: Color(GColors.grayColor)),
                          16.height,
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Description',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Icon(GIcons.arrowDownIcon),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Sportswear is no longer under culture, it is no longer indie or cobbled together as it once was. Sport is fashion today. The top is oversized in fit and style, may need to size down.',
                                style: TextStyle(
                                    height: 1.6,
                                    color: Color(GColors.blackSlideColor)),
                              ),
                            ],
                          ),
                          24.height,
                          Divider(color: Color(GColors.grayColor)),
                          16.height,
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Reviews',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Icon(GIcons.arrowDownIcon),
                                ],
                              ),
                              16.height,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '4.8',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      12.width,
                                      Text(
                                        'out of 5'.toUpperCase(),
                                        style: TextStyle(
                                            color:
                                                Color(GColors.blackGrayColor)),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        children: List.generate(
                                          5,
                                          (starIndex) => Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Icon(
                                              CupertinoIcons.star_circle_fill,
                                              size: 16,
                                              color: starIndex < 3
                                                  ? Color(GColors.greenColor)
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      4.height,
                                      Text(
                                        '102 ratings',
                                        style: TextStyle(
                                            color:
                                                Color(GColors.blackGrayColor),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          16.height,
                          ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              reverse: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (item, index) {
                                return Row(
                                  children: <Widget>[
                                    Text(
                                      arrStarRate[index]['id'].toString(),
                                      style: TextStyle(
                                          color: Color(GColors.blackGrayColor)),
                                    ),
                                    8.width,
                                    Icon(
                                      CupertinoIcons.star_circle_fill,
                                      size: 14,
                                      color: Color(GColors.greenColor),
                                    ),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 4,
                                            decoration: BoxDecoration(
                                                color: Color(GColors.grayColor),
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    64) *
                                                (arrStarRate[index]['ratio'] /
                                                    100),
                                            height: 4,
                                            decoration: BoxDecoration(
                                                color:
                                                    Color(GColors.greenColor),
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      width: 32,
                                      child: Text(
                                        '${arrStarRate[index]['ratio']}%',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (item, index) {
                                return Container(
                                  height: 16,
                                );
                              },
                              itemCount: arrStarRate.length),
                          16.height,
                          Center(
                              child: Text(
                            'See more reviews',
                            style: TextStyle(color: Colors.blue.shade400),
                          )),
                          16.height,
                          Divider(color: Color(GColors.grayColor)),
                        ],
                      ),
                    ),
                    ProductListHorizontal(
                        data: [], title: 'Similar Product', noPadding: true)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(18),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(GColors.blackColor),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    GIcons.addToCartIcon,
                    color: Color(GColors.whiteColor),
                  ),
                  8.width,
                  Text(
                    'Add To Cart',
                    style: TextStyle(
                        color: Color(GColors.whiteColor),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  // 1.height,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
