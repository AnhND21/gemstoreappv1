import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/presentation/screens/home_screen.dart';
import 'package:gemstoreappv1/presentation/tabs/discover_screen.dart';
import 'package:gemstoreappv1/presentation/tabs/my_order_screen.dart';
import 'package:gemstoreappv1/presentation/tabs/settings_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';

class GTabController extends GetxController {
  final RxInt selectedIndex = 0.obs; // Định nghĩa selectedIndex là RxInt

  void changeTab(int index) {
    selectedIndex.value = index;
    // print('Changed to tab $index'); // Debug nếu cần
  }
}

class AppRouterScreen extends StatefulWidget {
  const AppRouterScreen({super.key});

  @override
  State<AppRouterScreen> createState() => _AppRouterScreenState();
}

class _AppRouterScreenState extends State<AppRouterScreen> {
  final GTabController tabController = Get.find<GTabController>(); // Lấy instance từ GetX

  // Danh sách các màn hình tương ứng với từng tab
  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    DiscoverScreen(),
    MyOrderScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    tabController.selectedIndex.listen((index) {
      if (mounted) setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Center(
        child: _screens.elementAt(tabController.selectedIndex.value),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(GColors.whiteColor),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            color: Color(GColors.activeFilterColor),
            gap: 8,
            activeColor: Color(GColors.activeFilterColor),
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Color(GColors.primaryLight),
            onTabChange: (index) {
              tabController.changeTab(index);
            },
            selectedIndex: tabController.selectedIndex.value,
            tabs: const [
              GButton(
                icon: CupertinoIcons.house_alt,
                text: 'Home',
              ),
              GButton(
                icon: CupertinoIcons.search,
                text: 'Discover',
              ),
              GButton(
                icon: CupertinoIcons.shopping_cart,
                text: 'My Orders',
              ),
              GButton(
                icon: CupertinoIcons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    ));
  }
}