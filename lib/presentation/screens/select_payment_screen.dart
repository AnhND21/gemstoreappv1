import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/core/widgets/button.dart';
import 'package:gemstoreappv1/presentation/widgets/credit_card_item.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class SelectPaymentScreen extends StatefulWidget {
  const SelectPaymentScreen({super.key});

  @override
  State<SelectPaymentScreen> createState() => _SelectPaymentScreenState();
}

class _SelectPaymentScreenState extends State<SelectPaymentScreen> {
  final List<Map<String, dynamic>> methods = [
    {
      'id': 1,
      'type': 'card',
      'name': 'Credit Card',
      'icon': CupertinoIcons.creditcard,
      'selected': false
    },
    {
      'id': 2,
      'type': 'cash',
      'name': 'Cash',
      'icon': CupertinoIcons.money_dollar_circle,
      'selected': true
    },
    {
      'id': 3,
      'type': 'btc',
      'name': 'Bitcoin',
      'icon': CupertinoIcons.bitcoin_circle,
      'selected': false
    },
  ];

  final List<Map<String, dynamic>> cards = [
    {
      'id': 1,
      'name': 'nguyen duy anh',
      'number': '4221 1234 5678 9999',
      'valid': '05/26'
    },
    {
      'id': 2,
      'name': 'nguyen duy anh',
      'number': '4221 1234 5678 9999',
      'valid': '05/26'
    },
    {
      'id': 3,
      'name': 'nguyen duy anh',
      'number': '4221 1234 5678 9999',
      'valid': '05/26'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBar(
        title: 'Payment',
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.height -
                kToolbarHeight -
                32, // Trừ chiều cao AppBar và padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                          _buildDotSpacer(),
                          Icon(
                            CupertinoIcons.checkmark_circle_fill,
                            color: Color(GColors.blackGrayColor),
                          ),
                        ],
                      ),
                      32.height,
                      Text(
                        'Step 2'.toUpperCase(),
                        style: TextStyle(
                            color: Color(GColors.blackGrayColor), fontSize: 16),
                      ),
                      8.height,
                      Text(
                        'Select Payment Method',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      16.height,
                    ],
                  ),
                ),

                ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (dynamic item, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 3 - 16,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(GColors.whiteColor),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                          children: <Widget>[
                            Icon(
                              methods[index]['selected'] == true
                                  ? CupertinoIcons.checkmark_alt_circle_fill
                                  : CupertinoIcons.circle,
                              color: Color(GColors.greenColor),
                            ),
                            12.width,
                            Icon(methods[index]['icon']),
                            12.width,
                            Text(methods[index]['name'])
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (dynamic item, int index) {
                      return Container(
                        height: 16,
                      );
                    },
                    itemCount: methods.length),
                32.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Choose your card',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        child: Text(
                          'Add new +',
                          style: TextStyle(color: Color(GColors.redColor)),
                        ),
                      )
                    ],
                  ),
                ),
                16.height,
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    enableInfiniteScroll: false,
                  ),
                  items: cards.map((item) {
                    return SizedBox(
                      width: MediaQuery.of(context)
                          .size
                          .width, // Giới hạn chiều rộng
                      child: CreditCardItem(
                          name: item['name'],
                          numOfCard: item['number'],
                          valid: item['valid']),
                    );
                  }).toList(),
                ),
                24.height,
                // payment details
                Container(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 40),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(GColors.whiteColor),
                    borderRadius: BorderRadius.circular(16),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.2),
                    //     spreadRadius: 1,
                    //     blurRadius: 8,
                    //     offset: Offset(1, 1),
                    //   ),
                    // ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Product price',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '\$100.00',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      16.height,
                      Divider(
                        color: Color(GColors.grayColor),
                      ),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Shipping',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '\$5.00',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      16.height,
                      Divider(
                        color: Color(GColors.grayColor),
                      ),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Subtotal',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '\$105.00',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      32.height,
                      Row(
                        children: <Widget>[
                          InkWell(
                            child: Icon(
                              CupertinoIcons.checkmark_square_fill,
                              color: Color(GColors.greenColor),
                            ),
                          ),
                          8.width,
                          Text('I agree to '),
                          Text(
                            'Terms and Conditions',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          )
                        ],
                      ),
                      32.height,
                      Button(
                          title: 'Place my order',
                          onPressed: () {
                            context.push(AppRoutes.paymentSuccessScreen);
                          })
                    ],
                  ),
                )
              ],
            ),
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
                color: bgColor  ?? Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
