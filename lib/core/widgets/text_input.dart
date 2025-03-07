import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';

class TextInput extends StatelessWidget {
  final String? title;
  final String? hintText;
  final String? suffixText;
  final IconData? prefixIcon;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final bool isRequired;
  final bool noBorder;
  final int maxLines;

  const TextInput({
    super.key,
    this.controller,
    this.title,
    this.hintText,
    this.prefixIcon,
    this.suffixText,
    this.suffixWidget,
    this.isRequired = false,
    this.noBorder = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title != null
            ? Row(
                children: <Widget>[
                  Text(
                    title!,
                    style: TextStyle(
                        color: Color(GColors.blackGrayColor), fontSize: 13),
                  ),
                  2.width,
                  isRequired
                      ? Text(
                          '*',
                          style: TextStyle(color: Color(GColors.redColor)),
                        )
                      : Container()
                ],
              )
            : Container(),
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          maxLines: maxLines,
          controller: controller,
          // onChanged: (value) {
          //   _password.value = TextEditingValue(
          //       text: value,
          //       selection: _password.selection);
          // },
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          obscureText: false,
          cursorColor: Color(GColors.blackSlideColor),
          cursorWidth: 1,
          decoration: InputDecoration(
            suffixIcon: suffixWidget ??
                (suffixText != null
                    ? Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Text(
                          suffixText!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(GColors.greenColor),
                          ),
                        ),
                      )
                    : null),
            prefixIcon: prefixIcon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    // Chỉ chiếm không gian tối thiểu
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          prefixIcon,
                          size: 22,
                        ),
                      ),
                      SizedBox(width: 8),
                      // Thêm khoảng cách 8px giữa icon và hintText
                    ],
                  )
                : null,
            prefixIconConstraints: BoxConstraints(
              minWidth: 0,
              // Đảm bảo có đủ khoảng cách tối thiểu cho icon
              minHeight: 0,
            ),
            suffixIconConstraints: BoxConstraints(
              minWidth: 0,
              // Đảm bảo có đủ khoảng cách tối thiểu cho icon
              minHeight: 0,
            ),
            isDense: true,
            hintStyle: TextStyle(
              height: 1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            hintText: hintText ?? '',
            enabledBorder: noBorder
                ? InputBorder.none
                : UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(GColors.grayColor),
                      // Màu viền khi không focus
                      width: 1,
                    ),
                  ),
            focusedBorder: noBorder
                ? InputBorder.none
                : UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(GColors.blackGrayColor),
                      // Màu viền khi được focus
                      width: 1.0,
                    ),
                  ),
            contentPadding: EdgeInsets.symmetric(vertical: 4),
          ),
        ),
      ],
    );
  }
}
