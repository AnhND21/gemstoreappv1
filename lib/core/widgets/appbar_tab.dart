import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';

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
          // context.pop();
        },
        icon: leading ??
            Image.asset(
              'assets/icons/menu_icon.png',
              scale: 2,
            ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell,
              color: Color(GColors.blackColor),
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
