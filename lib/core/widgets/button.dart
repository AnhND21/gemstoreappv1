import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';

class Button extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final int? bgColor;
  final int? textColor;
  final EdgeInsets? margin;
  final bool? loading;
  final bool? noPadding;
  final bool? isShowBorder;

  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    this.bgColor,
    this.textColor,
    this.loading,
    this.margin,
    this.noPadding = false,
    this.isShowBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading != null && loading == true ? null : onPressed,
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: WidgetStateProperty.all(
            Colors.transparent), // Thay MaterialStateProperty
        overlayColor:
            WidgetStateProperty.all(Colors.transparent), // Bỏ hiệu ứng hover
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(
          isShowBorder!
              ? Colors.transparent
              : Color(bgColor ?? GColors.blackColor),
        ),
        padding: WidgetStateProperty.all(
          noPadding! ? null : const EdgeInsets.all(12),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: isShowBorder!
                ? const BorderSide(color: Colors.black, width: 1.0)
                : BorderSide.none,
          ),
        ),
      ),
      child: Center(
        child: loading != null && loading == true
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  color: Colors.white,
                ),
              )
            : Text(
                title ?? 'Button',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(textColor ?? GColors.whiteColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
