import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/core/widgets/button.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBar(
        title: 'Payment Success',
        onPressed: () {
          context.go(AppRoutes.appStack, extra: {'success': true});
        },
      ),
      body: SingleChildScrollView(
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
                    CupertinoIcons.location_solid,
                    color: Color(GColors.blackColor),
                  ),
                  _buildDotSpacer(bgColor: Color(GColors.blackSlideColor)),
                  Icon(
                    CupertinoIcons.creditcard_fill,
                    color: Color(GColors.blackColor),
                  ),
                  _buildDotSpacer(bgColor: Color(GColors.blackSlideColor)),
                  Icon(
                    CupertinoIcons.checkmark_circle_fill,
                    color: Color(GColors.blackColor),
                  ),
                ],
              ),
              32.height,
              Text(
                'Order Completed',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              24.height,
              32.height,
              Center(
                  child: Icon(
                CupertinoIcons.bag,
                size: 100,
              )),
              24.height,
              Center(
                  child: Text(
                style: TextStyle(fontSize: 16),
                'Thank you for your purchase.\n You can view your order in ‘My Orders’ section.',
                textAlign: TextAlign.center,
              )),
              24.height,
              32.height,
              Button(
                  title: 'Continue Shopping',
                  onPressed: () {
                    context.go(AppRoutes.appStack, extra: {'success': true});
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDotSpacer({Color? bgColor}) {
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
                color: bgColor ?? Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
