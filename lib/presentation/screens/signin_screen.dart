import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/widgets/button.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Align(
          alignment: Alignment.bottomLeft,
          child: SizedBox(
            width: double.infinity, // Mở rộng tối đa
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Log into \n your account',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 48,
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
                      suffixIconConstraints: BoxConstraints(
                        minWidth: 32,
                        // Đảm bảo có đủ khoảng cách tối thiểu cho icon
                        minHeight: 32,
                      ),
                      isDense: true,
                      hintStyle: TextStyle(
                        height: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Email address',
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
                    height: 16,
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
                      suffixIcon: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 22,
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                        minWidth: 32,
                        // Đảm bảo có đủ khoảng cách tối thiểu cho icon
                        minHeight: 32,
                      ),
                      isDense: true,
                      hintStyle: TextStyle(
                        height: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Password',
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
                    height: 24,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        context.push(AppRoutes.forgotPassword);
                      },
                      child: Text('Forgot Password?'),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Button(
                      title: 'LOG IN',
                      onPressed: () {
                        context.go(AppRoutes.appStack);
                      }),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                      child: Text(
                    'or log in with',
                    style: TextStyle(color: Color(GColors.blackGrayColor)),
                  )),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                                color: Color(GColors.grayColor), width: 2)),
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/icons/apple_icon.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                                color: Color(GColors.grayColor), width: 2)),
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/icons/google_icon.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                                color: Color(GColors.grayColor), width: 2)),
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/icons/fb_icon.png',
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        SizedBox(
                          width: 4,
                        ),
                        InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
