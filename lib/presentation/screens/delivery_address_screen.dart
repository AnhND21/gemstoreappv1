import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  final List<Map<String, dynamic>> data = [
    {'id': 1, 'type': 'home', 'address': '106 La Noi, Duong Noi, Ha Dong'},
    {'id': 2, 'type': 'office', 'address': 'A10 Fenikaa, Yen Nghia, Ha Dong'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBar(
        title: 'Delivery Address',
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: Row(
              children: [
                Icon(
                  GIcons.plusIcon,
                  color: Color(GColors.blackColor),
                ),
                8.width
              ],
            ),
          )
        ],
      ),
      body: ListView.separated(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (dynamic item, int index) {
            return Container(
              decoration: BoxDecoration(),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.circle)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(data[index]['type']),
                      Text(data[index]['address'])
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (dynamic item, int index) {
            return 16.height;
          },
          itemCount: data.length),
    );
  }
}
