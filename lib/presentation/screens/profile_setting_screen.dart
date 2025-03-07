import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/core/widgets/button.dart';
import 'package:gemstoreappv1/core/widgets/text_input.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GAppBar(
        title: 'Information',
        // actions: [
        //   IconButton(
        //     splashColor: Colors.transparent,
        //     focusColor: Colors.transparent,
        //     highlightColor: Colors.transparent,
        //     onPressed: () {},
        //     icon: Row(
        //       children: [
        //         Icon(
        //           GIcons.tickIcon,
        //           color: Color(GColors.greenColor),
        //         ),
        //         8.width
        //       ],
        //     ),
        //   )
        // ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://avatar.iran.liara.run/public',
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 8,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Color(GColors.greenColor),
                              borderRadius: BorderRadius.circular(32)),
                          child: Icon(
                            GIcons.cameraIcon,
                            color: Colors.white,
                            size: 20,
                          ),
                        ))
                  ],
                ),
              ),
              kToolbarHeight.height,
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style: TextStyle(
                              color: Color(GColors.blackGrayColor),
                              fontSize: 12),
                        ),
                        4.height,
                        TextInput(
                          hintText: 'Enter first Name',
                        ),
                      ],
                    ),
                  ),
                  32.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name',
                          style: TextStyle(
                              color: Color(GColors.blackGrayColor),
                              fontSize: 12),
                        ),
                        4.height,
                        TextInput(
                          hintText: 'Enter last Name',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              24.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                        color: Color(GColors.blackGrayColor), fontSize: 12),
                  ),
                  4.height,
                  TextInput(
                    hintText: 'Enter your email',
                  ),
                ],
              ),
              24.height,
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                              color: Color(GColors.blackGrayColor),
                              fontSize: 12),
                        ),
                        4.height,
                        TextInput(
                          hintText: 'Male',
                        ),
                      ],
                    ),
                  ),
                  32.width,
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              color: Color(GColors.blackGrayColor),
                              fontSize: 12),
                        ),
                        4.height,
                        TextInput(
                          hintText: 'Enter your phone number',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              64.height,
              Button(title: 'Save Change', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
