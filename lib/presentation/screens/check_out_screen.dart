import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBar(
        title: 'Check out',
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: MediaQuery.of(context).size.height -
                kToolbarHeight -
                32, // Trừ chiều cao AppBar và padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Color(GColors.blackColor),
                    ),
                    _buildDotSpacer(),
                    Icon(
                      CupertinoIcons.creditcard_fill,
                      color: Color(GColors.blackGrayColor),
                    ),
                    _buildDotSpacer(),
                    Icon(
                      CupertinoIcons.checkmark_circle_fill,
                      color: Color(GColors.blackGrayColor),
                    ),
                  ],
                ),
                16.height,
                Text(
                  'Step 1'.toUpperCase(),
                  style: TextStyle(
                      color: Color(GColors.blackGrayColor), fontSize: 16),
                ),
                8.height,
                Text(
                  'Add Information',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDotSpacer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: List.generate(
          8, // Số lượng dấu chấm
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              width: 4.0, // Kích thước dấu chấm
              height: 4.0,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
