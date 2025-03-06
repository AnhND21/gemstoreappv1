import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/presentation/screens/home_screen.dart';
import 'package:gemstoreappv1/presentation/tabs/discover_screen.dart';
import 'package:gemstoreappv1/presentation/tabs/my_order_screen.dart';
import 'package:gemstoreappv1/presentation/tabs/settings_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class GTabController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}

class AppRouterScreen extends StatefulWidget {
  const AppRouterScreen({super.key});

  @override
  State<AppRouterScreen> createState() => _AppRouterScreenState();
}

class _AppRouterScreenState extends State<AppRouterScreen> {
  final GTabController tabController = Get.find<GTabController>();

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    DiscoverScreen(),
    MyOrderScreen(),
    SettingsScreen(),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   print('AppRouterScreen initState called'); // Debug
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     print('Post frame callback executed'); // Debug
  //     final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
  //     print('Extra received: $extra'); // Debug
  //     if (extra != null && extra['success'] == true) {
  //       print('Switching to Home tab (index 0)'); // Debug
  //       tabController.changeTab(0);
  //     } else {
  //       print('No valid extra or success is not true'); // Debug
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _screens.elementAt(tabController.selectedIndex.value),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: GNav(
                color: Color(GColors.activeFilterColor),
                gap: 8,
                activeColor: Color(GColors.activeFilterColor),
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Color(GColors.primaryLight),
                selectedIndex: tabController.selectedIndex.value,
                onTabChange: (index) {
                  tabController.changeTab(index);
                },
                tabs: const [
                  GButton(
                    icon: HugeIcons.strokeRoundedHome04,
                    text: 'Home',
                  ),
                  GButton(
                    icon: HugeIcons.strokeRoundedSearch01,
                    text: 'Discover',
                  ),
                  GButton(
                    icon: HugeIcons.strokeRoundedShoppingBag01,
                    text: 'My Orders',
                  ),
                  GButton(
                    icon: HugeIcons.strokeRoundedSettings02,
                    text: 'Settings',
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
