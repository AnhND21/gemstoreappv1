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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: Color(GColors.greenColor),
                ),
                8.width
              ],
            ),
          )
        ],
      ),
    );
  }
}
