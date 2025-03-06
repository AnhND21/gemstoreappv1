import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
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
              Text(
                content,
                style: TextStyle(fontSize: 12, color: Color(GColors.grayColor)),
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
          children: [_renderStatus(extraData?['status'])],
        ),
      ),
    );
  }
}
