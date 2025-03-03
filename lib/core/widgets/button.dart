import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';

class Button extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final int? bgColor;
  final int? textColor;
  final EdgeInsets? margin;
  final bool? loading;

  const Button(
      {super.key,
        required this.title,
        required this.onPressed,
        this.bgColor,
        this.textColor,
        this.loading,
        this.margin});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading != null && loading == true ? null : onPressed,
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Color(bgColor ?? GColors.blackColor),
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Adjust corner radius
        ),
      ),
      child: Center(
        child: loading != null && loading == true
            ? SizedBox(
          height: 20, // Chiều cao của spinner
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            color: Colors.white,
          ),
        )
            : Text(
          title ?? "Button",
          style: TextStyle(
              fontSize: 14.0,
              color: Color(textColor ?? GColors.whiteColor),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
