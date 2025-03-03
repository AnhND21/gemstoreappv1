import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/core/widgets/button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                  'Enter email associated with your account and we’ll send and email with intructions to reset your password',
                  style: TextStyle(
                      color: Color(GColors.blackGrayColor),
                      height: 1.8,
                      fontSize: 13)),
              SizedBox(
                height: 32,
              ),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                // controller: _password,
                // onChanged: (value) {
                //   _password.value = TextEditingValue(
                //       text: value,
                //       selection: _password.selection);
                // },
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    // Chỉ chiếm không gian tối thiểu
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.email_outlined,
                          size: 22,
                        ),
                      ),
                      SizedBox(width: 8),
                      // Thêm khoảng cách 8px giữa icon và hintText
                    ],
                  ),
                  prefixIconConstraints: BoxConstraints(
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
                  hintText: 'Enter your email here',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(GColors.grayColor),
                      // Màu viền khi không focus
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(GColors.primaryColor),
                      // Màu viền khi được focus
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Button(
                  title: 'SEND REQUEST',
                  onPressed: () {},
                  bgColor: GColors.blackColor)
            ],
          ),
        ),
      ),
    );
  }
}
