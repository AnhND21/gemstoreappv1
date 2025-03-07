import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';

class HomeHeaderFilter extends StatefulWidget {
  HomeHeaderFilter({super.key});

  @override
  State<HomeHeaderFilter> createState() => _HomeHeaderFilterState();
}

class _HomeHeaderFilterState extends State<HomeHeaderFilter> {
  final List<Map<String, dynamic>> actions = [
    {
      'id': 1,
      'title': 'Women',
      'icon': GIcons.girlIcon,
      'isActive': false
    },
    {
      'id': 2,
      'title': 'Men',
      'icon': GIcons.boyIcon,
      'isActive': true
    },
    {
      'id': 3,
      'title': 'Accessories',
      'icon': GIcons.neckLaceIcon,
      'isActive': false
    },
    {
      'id': 4,
      'title': 'Beauty',
      'icon': GIcons.beautyIcon,
      'isActive': false
    },
    {
      'id': 5,
      'title': 'Shoes',
      'icon': GIcons.shoesIcon,
      'isActive': false
    },
  ];

  void setActive(int id) {
    setState(() {
      for (var action in actions) {
        action['isActive'] = action['id'] == id;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: actions.asMap().entries.map((entry) {
            final action = entry.value;
            final isActive = action['isActive'] as bool;
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setActive(action['id']);
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2),
                        // Khoảng cách giữa border và content
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, // Đảm bảo border tròn
                            border: Border.all(
                              color: Color(isActive
                                  ? GColors.activeFilterColor
                                  : GColors.whiteColor),
                              width: 2,
                            )),
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: isActive
                                ? Color(GColors.activeFilterColor)
                                : Color(GColors.grayColor),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Icon(
                            action['icon'],
                            color: Color(isActive ? GColors.whiteColor: GColors.blackGrayColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        action['title'],
                        style: TextStyle(
                            color: Color(isActive
                                ? GColors.blackColor
                                : GColors.blackGrayColor)),
                      )
                    ],
                  ),
                ),
                // Thêm khoảng cách cố định giữa các item, ngoại trừ item cuối
                if (entry.key < actions.length - 1)
                  SizedBox(width: 32), // Khoảng cách cố định 24px
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
