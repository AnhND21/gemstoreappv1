import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/core/widgets/button.dart';
import 'package:gemstoreappv1/presentation/widgets/cart_listing.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  final List<Map<String, dynamic>> carts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBar(
        title: 'My Cart',
      ),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            CartListing(data: []),
            // ProductListHorizontal(data: [], title: 'More Product',),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(24),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(GColors.whiteColor),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
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
                      24.height,
                      Button(
                          title: 'Proceed to checkout',
                          onPressed: () {
                            context.go(AppRoutes.checkOutScreen);
                          })
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
