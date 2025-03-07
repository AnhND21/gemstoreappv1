import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';

class NotificationList extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const NotificationList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (dynamic item, int index) {
          final notify = data[index];
          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: notify['isRead']
                    ? Color(GColors.whiteColor)
                    : Color(GColors.grayColor).withOpacity(0.5)),
            child: Row(
              children: <Widget>[
                Icon(GIcons.notifyIcon),
                16.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        notify['title'],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      2.height,
                      Text(
                        notify['content'],
                        style: TextStyle(color: Color(GColors.blackSlideColor)),
                      ),
                    ],
                  ),
                ),
                !notify['isRead']
                    ? Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                            color: Color(GColors.redColor),
                            borderRadius: BorderRadius.circular(3)),
                      )
                    : Container()
              ],
            ),
          );
        },
        separatorBuilder: (dynamic item, int index) {
          return Container();
        },
        itemCount: data.length);
  }
}
