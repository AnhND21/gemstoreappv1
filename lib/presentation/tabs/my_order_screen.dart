import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar_tab.dart';
import 'package:gemstoreappv1/presentation/widgets/order_product_list.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GAppBarTab(
        title: 'My Orders',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DefaultTabController(
          length: 3, // Số lượng tab
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              // Điều chỉnh chiều cao của AppBar
              child: AppBar(
                backgroundColor: Colors.white,
                toolbarHeight: 0,
                bottom: TabBar(
                  splashFactory: NoSplash.splashFactory,
                  // Loại bỏ hiệu ứng splash
                  dividerHeight: 0,
                  labelColor: Colors.white,
                  // Màu của tab được chọn
                  unselectedLabelColor: Colors.grey,
                  // Màu của tab không được chọn
                  indicator: const BoxDecoration(
                    color: Color(GColors.blackColor),
                    // Màu nền của tab được chọn
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  indicatorPadding: const EdgeInsets.all(8),
                  // Giảm padding
                  indicatorSize: TabBarIndicatorSize.tab,
                  automaticIndicatorColorAdjustment: true,
                  labelStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  labelPadding: EdgeInsets.only(top: 2),
                  tabs: [
                    Tab(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            GIcons.deliveryDelayIcon,
                            size: 16,
                          ),
                          4.width,
                          Text('Pending'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            GIcons.deliveredIcon,
                            size: 16,
                          ),
                          4.width,
                          Text('Delivered'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            GIcons.deliveryCancelIcon,
                            size: 16,
                          ),
                          4.width,
                          Text('Cancelled'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                OrderProductList(
                  data: [],
                ),
                OrderProductList(
                  data: [],
                ),
                OrderProductList(
                  data: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
