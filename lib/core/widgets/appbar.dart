import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:go_router/go_router.dart';

class GAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final VoidCallback? onPressed;
  final bool? border;

  GAppBar(
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
      leadingWidth: 72,
      leading: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: leading ??
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center, // Đưa icon vào giữa
              decoration: BoxDecoration(
                color: Color(GColors.whiteColor),
                shape: BoxShape.circle, // Dùng circle để đẹp hơn
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Icon(
                Icons.chevron_left,
                color: Color(GColors.blackColor),
                size: 26, // Giảm size icon
              ),
            ),
      ),
      actions: actions,
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
