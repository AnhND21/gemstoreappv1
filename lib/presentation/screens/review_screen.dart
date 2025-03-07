import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/core/widgets/button.dart';
import 'package:gemstoreappv1/core/widgets/dashed_border_painter.dart';
import 'package:gemstoreappv1/core/widgets/text_input.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBar(
        title: 'Review Product',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(GColors.blackSlideColor),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        GIcons.giftIcon,
                        color: Color(GColors.whiteColor),
                        size: 22,
                      ),
                      8.width,
                      Text(
                        'Submit your review to get 5 points',
                        style: TextStyle(
                            color: Color(GColors.whiteColor), fontSize: 13),
                      ),
                    ],
                  ),
                  Icon(
                    GIcons.arrowRightIcon,
                    size: 22,
                    color: Color(GColors.whiteColor),
                  ),
                ],
              ),
            ),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                5,
                (starIndex) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  child: Icon(
                    CupertinoIcons.star_circle_fill,
                    size: 42,
                    color:
                        starIndex < 3 ? Color(GColors.greenColor) : Colors.grey,
                  ),
                ),
              ),
            ),
            24.height,
            Container(
              height: 230,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(GColors.whiteColor),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: TextInput(
                maxLines: 9,
                hintText:
                    'Would you like to write anything about this product?',
                noBorder: true,
              ),
            ),
            24.height,
            Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: CustomPaint(
                    painter: DashedBorderPainter(),
                    child: Center(
                      child: Icon(GIcons.imageIcon,
                          size: 30, color: Color(GColors.blackSlideColor)),
                    ),
                  ),
                ),
                24.width,
                Container(
                  width: 60,
                  height: 60,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: CustomPaint(
                    painter: DashedBorderPainter(),
                    child: Center(
                      child: Icon(GIcons.cameraIcon,
                          size: 30, color: Color(GColors.blackSlideColor)),
                    ),
                  ),
                )
              ],
            ),
            48.height,
            Button(title: 'Submit Review', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
