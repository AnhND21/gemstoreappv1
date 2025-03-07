import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/main.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class GAppBarTab extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final VoidCallback? onPressed;
  final bool? border;

  GAppBarTab(
      {super.key,
      this.title,
      this.actions,
      this.leading,
      this.onPressed,
      this.border = false});

  @override
  Widget build(BuildContext context) {
    final MyDrawerController drawerController = Get.find<MyDrawerController>();
    return AppBar(
      backgroundColor: Color(GColors.whiteColor),
      centerTitle: true,
      title: Text(
        title ?? '',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(GColors.blackColor)),
      ),
      leading: IconButton(
        onPressed: () {
          drawerController.toggleDrawer();
        },
        icon: leading ??
            HugeIcon(icon: GIcons.menuIcon, color: Color(GColors.blackColor)),
      ),
      actions: [
        IconButton(
            onPressed: () {
              context.push(AppRoutes.notificationScreen);
            },
            icon: Stack(
              children: [
                Icon(
                  GIcons.notifyIcon,
                  color: Color(GColors.blackColor),
                ),
                Positioned(
                    right: 2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8)),
                    ))
              ],
            ))
      ],
      bottom: border!
          ? PreferredSize(
              preferredSize: Size.fromHeight(1.0), // Height of the border
              child: Container(
                color: Color(GColors.whiteColor), // Border color
                height: .5, // Border height
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
}
