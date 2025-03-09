import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<Map<String, dynamic>> actions = [
    {
      'title': 'Address',
      'icon': GIcons.locationIcon,
      'showRight': true,
      'label': null,
      'type': 'address'
    },
    {
      'title': 'Payment Method',
      'icon': GIcons.paymentMethodIcon,
      'showRight': true,
      'label': null,
      'type': 'payment'
    },
    {
      'title': 'Voucher',
      'icon': GIcons.couponIcon,
      'showRight': true,
      'label': null,
      'type': 'voucher'
    },
    {
      'title': 'My Cart',
      'icon': GIcons.cartIcon,
      'showRight': true,
      'label': null,
      'type': 'cart'
    },
    {
      'title': 'My Whitelist',
      'icon': GIcons.whiteListIcon,
      'showRight': true,
      'label': null,
      'type': 'whitelist'
    },
    {
      'title': 'Rate this app',
      'icon': GIcons.rateIcon,
      'showRight': true,
      'label': null,
      'type': 'rate'
    },
    {
      'title': 'Logout',
      'icon': GIcons.logoutIcon,
      'showRight': false,
      'label': null,
      'type': 'logout'
    },
  ];

  void onPressedAction(String type) {
    String screen = '';
    switch (type) {
      case 'cart':
        screen = AppRoutes.myCart;
        break;
      case 'address':
        screen = AppRoutes.deliveryAddressScreen;
        break;
    }
    context.push(screen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // Use min to avoid taking infinite height
          children: <Widget>[
            (kToolbarHeight * 1.5).height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://avatar.iran.liara.run/public',
                        ),
                      ),
                      15.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Sunie Pham',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'sunieux@gmail.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      context.push(AppRoutes.profileSettingScreen);
                    },
                    icon: const Icon(GIcons.settingsIcon),
                  ),
                ],
              ),
            ),
            kToolbarHeight.height,
            ListView.separated(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              // Ensures ListView takes only the space it needs
              physics: const NeverScrollableScrollPhysics(),
              // Parent scroll handles scrolling
              itemBuilder: (context, index) {
                final item = actions[index];
                return InkWell(
                  onTap: () {
                    onPressedAction(item['type']);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            item['icon'],
                            color: Color(item['showRight']
                                ? GColors.blackColor
                                : GColors.redColor),
                            size: 26,
                          ),
                          12.width,
                          // Add spacing between icon and text
                          Text(
                            item['title'],
                            style: TextStyle(
                                color: Color(item['showRight']
                                    ? GColors.blackColor
                                    : GColors.redColor),
                                fontSize: 16),
                          ),
                        ],
                      ),
                      item['showRight']
                          ? const Icon(
                              GIcons.arrowRightIcon,
                              size: 24,
                            ) // Replace with GIcons.arrowRightIcon
                          : Container(),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return 28.height; // Replace with 16.height
              },
              itemCount: actions.length,
            ),
          ],
        ),
      ),
    );
  }
}
