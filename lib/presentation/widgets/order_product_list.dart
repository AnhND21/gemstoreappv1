import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/button.dart';

class OrderProductList extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  OrderProductList({super.key, required this.data});

  final List<Map<String, dynamic>> sample = [
    {
      'id': 1213,
      'date': '13/02/2025',
      'trackingNumber': 'IK213DG22',
      'quantity': '2',
      'subTotal': 100,
      'status': 0
    },
    {
      'id': 1313,
      'date': '09/02/2025',
      'trackingNumber': 'IK213DG22',
      'quantity': '2',
      'subTotal': 80,
      'status': 0
    },
    {
      'id': 1113,
      'date': '09/09/2023',
      'trackingNumber': 'IK213EE22',
      'quantity': '22',
      'subTotal': 180,
      'status': 0
    },
    {
      'id': 1113,
      'date': '09/09/2023',
      'trackingNumber': 'IK213EE22',
      'quantity': '22',
      'subTotal': 180,
      'status': 0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.fromLTRB(8, 16, 8, 32),
        shrinkWrap: true,
        itemBuilder: (dynamic item, int index) {
          final product = sample[index];
          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(GColors.whiteColor),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Order #${product['id']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      product['date'],
                      style: TextStyle(
                          color: Color(GColors.blackGrayColor), fontSize: 12),
                    )
                  ],
                ),
                8.height,
                Row(
                  children: <Widget>[
                    Text(
                      'Tracking number:',
                      style: TextStyle(color: Color(GColors.blackGrayColor)),
                    ),
                    16.width,
                    Text(
                      product['trackingNumber'],
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Quantity:',
                          style:
                              TextStyle(color: Color(GColors.blackGrayColor)),
                        ),
                        4.width,
                        Text(
                          product['quantity'],
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Subtotal:',
                          style:
                              TextStyle(color: Color(GColors.blackGrayColor)),
                        ),
                        4.width,
                        Text(
                          '\$${product['subTotal'].toString()}',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
                12.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'pending'.toUpperCase(),
                      style: TextStyle(color: Color(GColors.orangeColor)),
                    ),
                    Button(
                      title: 'Details',
                      onPressed: () {},
                      noPadding: true,
                      // textColor: GColors.greenColor,
                      // bgColor: GColors.transparent,
                    )
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (dynamic item, int index) {
          return 16.height;
        },
        itemCount: sample.length);
  }
}
