import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/presentation/widgets/home_banner.dart';
import 'package:gemstoreappv1/presentation/widgets/home_header_filter.dart';
import 'package:gemstoreappv1/presentation/widgets/home_slide_image.dart';
import 'package:gemstoreappv1/core/widgets/appbar_tab.dart';
import 'package:gemstoreappv1/presentation/widgets/product_list_horizontal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBarTab(
        title: 'GemStore',
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            HomeHeaderFilter(),
            HomeSlideImage(),
            ProductListHorizontal(
              data: [],
              title: 'Feature Products',
            ),
            HomeBanner(
              data: [],
            )
          ],
        ),
      ),
    );
  }
}
