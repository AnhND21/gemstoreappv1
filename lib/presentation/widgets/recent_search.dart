import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class RecentSearch extends StatelessWidget {
  final List<Map<String, String>> data;
  final String title;

  RecentSearch({super.key, required this.data, required this.title});

  final List<Map<String, String>> sampleData = [
    {'id': '1', 'content': 'Sunglasses'},
    {'id': '2', 'content': 'Sweater'},
    {'id': '3', 'content': 'Hoodie'},
    {'id': '4', 'content': 'Jacket'},
    {'id': '5', 'content': 'Gucci'},
    {'id': '16', 'content': 'Channel'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(GColors.blackGrayColor)),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  GIcons.deleteIcon,
                  size: 20,
                  color: Color(GColors.blackGrayColor),
                )),
          ],
        ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: sampleData.asMap().entries.map((item) {
            final json = item.value as dynamic;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: Color(GColors.grayColor),
                  borderRadius: BorderRadius.circular(12)),
              child: GestureDetector(
                onTap: () {
                  context.push(AppRoutes.searchDetails,
                      extra: {'item': json['content']});
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      json['content'],
                      style: TextStyle(
                          color: Color(GColors.blackSlideColor),
                          fontWeight: FontWeight.w500),
                    ),
                    8.width,
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        GIcons.deleteXIcon,
                        size: 14,
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
