import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/core/widgets/button.dart';
import 'package:gemstoreappv1/core/widgets/text_input.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

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
                      CupertinoIcons.location_solid,
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
                32.height,
                Text(
                  'Step 1'.toUpperCase(),
                  style: TextStyle(
                      color: Color(GColors.blackGrayColor), fontSize: 16),
                ),
                8.height,
                Text(
                  'Add Information',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                24.height,
                _buildForm(),
                32.height,
                _buildShippingMethod()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShippingMethod() {
    final List<Map<String, dynamic>> methods = [
      {
        'id': 1,
        'value': 'Free',
        'type': 'Delivery to home',
        'timeToDelivery': 'Delivery from 3 to 7 business days',
        'select': false
      },
      {
        'id': 2,
        'value': '\$5.90',
        'type': 'Delivery to home',
        'timeToDelivery': 'Delivery from 3 to 7 business days',
        'select': true
      },
      {
        'id': 3,
        'value': '\$10.90',
        'type': 'Delivery to home',
        'timeToDelivery': 'Delivery from 3 to 7 business days',
        'select': false
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Shipping Method',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          24.height,
          ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (dynamic item, int index) {
                return Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    8.width,
                    InkWell(
                        child: Icon(
                      methods[index]['select']
                          ? CupertinoIcons.checkmark_alt_circle_fill
                          : CupertinoIcons.circle,
                      color: Color(GColors.greenColor),
                    )),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(methods[index]['value']),
                            24.width,
                            Text(methods[index]['type'],
                                style: TextStyle(
                                    color: Color(GColors.blackSlideColor))),
                          ],
                        ),
                        8.height,
                        Text(
                          methods[index]['timeToDelivery'],
                          style:
                              TextStyle(color: Color(GColors.blackGrayColor)),
                        )
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (dynamic item, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  height: 1,
                  color: Color(GColors.grayColor),
                );
              },
              itemCount: methods.length),
          32.height,
          Text(
            'Coupon Code',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          16.height,
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Color(GColors.grayColor),
                borderRadius: BorderRadius.circular(12)),
            child: TextInput(
                noBorder: true,
                hintText: 'Have a code? Type it here',
                suffixText: 'Validate'),
          ),
          32.height,
          Text(
            'Billing Address',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          16.height,
          Row(
            children: <Widget>[
              Icon(CupertinoIcons.square, color: Color(GColors.blackGrayColor)),
              8.width,
              Text(
                'Copy address data from shipping',
                style: TextStyle(color: Color(GColors.blackGrayColor)),
              )
            ],
          ),
          32.height,
          Button(
              title: 'Continue to payment',
              onPressed: () {
                context.push(AppRoutes.selectPaymentScreen);
              })
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextInput(title: 'First name', isRequired: true),
        24.height,
        TextInput(title: 'Last name', isRequired: true),
        24.height,
        TextInput(title: 'Street name', isRequired: true),
        24.height,
        TextInput(title: 'City', isRequired: true),
        24.height,
        TextInput(
          title: 'State / Province',
        ),
        24.height,
        TextInput(
          title: 'Zip-code',
          isRequired: true,
        ),
        24.height,
        TextInput(title: 'Email address'),
        24.height,
        TextInput(
          title: 'Phone number',
          isRequired: true,
        ),
      ],
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
