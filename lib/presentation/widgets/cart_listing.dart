import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';

class CartListing extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  CartListing({super.key, required this.data});

  final List<Map<String, dynamic>> samples = [
    {
      'id': 'asdasd213sasd',
      'productName': 'Turtleneck Sweater',
      'price': '34.99',
      'cover':
          'https://www.shutterstock.com/image-photo/young-fashion-model-stylish-beige-600nw-2382157791.jpg',
      'size': 'M',
      'color': 'Red'
    },
    {
      'id': 'asdasd213sasd1',
      'productName': 'Long Sleeve Dress',
      'price': '9.99',
      'cover':
          'https://www.shutterstock.com/image-photo/young-black-woman-cream-suit-600nw-2491218847.jpg',
      'size': 'XXL',
      'color': 'Green'
    },
    {
      'id': 'asdasd213sasd2',
      'productName': 'Sportwear Set',
      'price': '11.99',
      'cover':
          'https://www.ukmodels.co.uk/wp-content/uploads/2015/08/shutterstock_267639224.jpg',
      'size': 'S',
      'color': 'Blue'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16),
          // shrinkWrap: true,
          itemBuilder: (item, index) {
            return Container(
              decoration: BoxDecoration(
                color: Color(GColors.whiteColor),
                borderRadius: BorderRadius.circular(24),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            bottomLeft: Radius.circular(24)),
                        child: Image.network(
                          samples[index]['cover'],
                          height: 100,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            samples[index]['productName'],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          2.height,
                          Text(
                            "\$${samples[index]['price']}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          2.height,
                          Row(
                            children: <Widget>[
                              Text('Size: ',
                                  style: TextStyle(
                                      color: Color(GColors.blackGrayColor))),
                              Text(samples[index]['size'],
                                  style: TextStyle(
                                      color: Color(GColors.blackGrayColor))),
                              6.width,
                              Text(
                                '|',
                                style: TextStyle(
                                    color: Color(GColors.blackGrayColor)),
                              ),
                              6.width,
                              Text('Color: ',
                                  style: TextStyle(
                                      color: Color(GColors.blackGrayColor))),
                              Text(samples[index]['color'],
                                  style: TextStyle(
                                      color: Color(GColors.blackGrayColor))),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.checkmark_square_fill,
                          color: Color(GColors.greenColor),
                        ),
                        24.height,
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(GColors.blackGrayColor)),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                CupertinoIcons.minus,
                                size: 16,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('1'),
                              ),
                              Icon(
                                CupertinoIcons.plus,
                                size: 16,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (item, index) {
            return Container(
              height: 24,
            );
          },
          itemCount: samples.length),
    );
  }
}
