// Navigation
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/presentation/screens/home_screen.dart';
import 'package:gemstoreappv1/presentation/tabs/discover_screen.dart';
import 'package:gemstoreappv1/presentation/tabs/my_order_screen.dart';
import 'package:gemstoreappv1/presentation/tabs/settings_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppRouterScreen extends StatefulWidget {
  const AppRouterScreen({super.key});

  @override
  State<AppRouterScreen> createState() => _AppRouterScreenState();
}

class _AppRouterScreenState extends State<AppRouterScreen> {
  int _selectedIndex = 0;

  // Danh sách các màn hình tương ứng với từng tab
  static const List<Widget> _screens = <Widget>[
    DiscoverScreen(),
    HomeScreen(),
    MyOrderScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _screens.elementAt(_selectedIndex), // Hiển thị màn hình tương ứng
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(GColors.whiteColor),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            // backgroundColor: Color(GColors.redColor),
            color:  Color(GColors.activeFilterColor),
            gap: 8,
            activeColor: Color(GColors.activeFilterColor),
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Color(GColors.primaryLight),
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index; // Cập nhật tab được chọn
              });
            },
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
    );
  }
}
