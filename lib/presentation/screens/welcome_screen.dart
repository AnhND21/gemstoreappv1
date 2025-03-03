import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/wel_bg.png',
            fit: BoxFit.cover,
          ),
          Positioned(
              child: Container(
            decoration: BoxDecoration(color: Color(GColors.blackColor).withOpacity(0.7)),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.13),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Welcome to GemStore!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center, // Căn giữa văn bản
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      ' The home for a fashionista',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center, // Căn giữa văn bản
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.go(AppRoutes.introduce);
                      },
                      style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: Colors.transparent,
                        elevation: 0,
                        backgroundColor: Color(GColors.blackGrayColor).withOpacity(0.8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32), // Bo góc
                          side: BorderSide(
                            color: Color(GColors.whiteColor), // Màu viền trắng
                            width: 1, // Độ dày viền
                          ),
                        ),
                      ),
                      child: Text('Get Started',
                          style: TextStyle(
                              color: Color(GColors.whiteColor),
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
