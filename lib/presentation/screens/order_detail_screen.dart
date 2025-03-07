import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/core/widgets/button.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  Widget _renderStatus(int status) {
    String title = '';
    String content = '';
    int color = 0;

    switch (status) {
      case 0:
        title = 'Your order is on the way';
        content = 'Click here to track your order.';
        color = GColors.orangeColor;
        break;
      case 1:
        title = 'Your order is delivered';
        content = 'Rate product to get 5 points for collect.';
        color = GColors.greenColor;

      case 2:
        title = 'Your order is cancelled';
        content = 'Click here to track your order.';
        color = GColors.redColor;
      default:
        break;
    }
    return Container(
      decoration: BoxDecoration(
          color: Color(color),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    TextStyle(color: Color(GColors.whiteColor), fontSize: 18),
              ),
              4.height,
              InkWell(
                onTap: () {
                  context.push(AppRoutes.trackOrderScreen);
                },
                child: Text(
                  content,
                  style:
                      TextStyle(fontSize: 12, color: Color(GColors.grayColor)),
                ),
              ),
            ],
          ),
          Icon(
            GIcons.deliveringCancelIcon,
            size: 42,
            color: Color(GColors.whiteColor),
          ),
        ],
      ),
    );
  }

  Widget _renderButtonByStatus(int status) {
    switch (status) {
      case 0:
        return Button(
            title: 'Continue Shopping',
            onPressed: () {
              context.pop();
            });
      case 1:
        return Row(
          children: <Widget>[
            Expanded(
              child: Button(
                  title: 'Back',
                  isShowBorder: true,
                  textColor: GColors.blackColor,
                  onPressed: () {
                    context.pop();
                  }),
            ),
            16.width,
            Expanded(
              child: Button(
                  title: 'Review',
                  onPressed: () {
                    context.push(AppRoutes.reviewScreen);
                  }),
            )
          ],
        );
      case 2:
        return Button(
          title: 'Back to Home',
          onPressed: () {
            context.pop();
          },
          isShowBorder: true,
          textColor: GColors.blackColor,
        );
      default:
        return Container();
    }
  }

  Widget _renderProductDetail() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Color(GColors.whiteColor),
            borderRadius: BorderRadius.circular(16),
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
                    'Order Number',
                    style: TextStyle(color: Color(GColors.blackGrayColor)),
                  ),
                  Text('#1828')
                ],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Tracking Number',
                    style: TextStyle(color: Color(GColors.blackGrayColor)),
                  ),
                  Text('KS12GS1HG')
                ],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Delivery Address',
                    style: TextStyle(color: Color(GColors.blackGrayColor)),
                  ),
                  Text('Duong Noi, Ha Dong, Ha Noi')
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Color(GColors.whiteColor),
            borderRadius: BorderRadius.circular(16),
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
                    'Maxi Dress',
                    style: TextStyle(
                        color: Color(GColors.blackColor),
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: <Widget>[
                      Text('x2'),
                      32.width,
                      Text('\$100.00'),
                    ],
                  ),
                ],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Channel Bag',
                    style: TextStyle(
                        color: Color(GColors.blackColor),
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: <Widget>[
                      Text('x1'),
                      32.width,
                      Text('\$89.00'),
                    ],
                  ),
                ],
              ),
              32.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Subtotal',
                    style: TextStyle(color: Color(GColors.blackGrayColor)),
                  ),
                  Text('\$189.00')
                ],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Shipping Fee',
                    style: TextStyle(color: Color(GColors.blackGrayColor)),
                  ),
                  Text('\$0.00')
                ],
              ),
              16.height,
              Divider(
                color: Color(GColors.grayColor),
              ),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(
                      color: Color(GColors.blackGrayColor),
                    ),
                  ),
                  Text(
                    '\$189.00',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final extraData = state.extra as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBar(
        title: 'Order Details',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _renderStatus(extraData?['status']),
            24.height,
            _renderProductDetail(),
            24.height,
            _renderButtonByStatus(extraData?['status'])
          ],
        ),
      ),
    );
  }
}
