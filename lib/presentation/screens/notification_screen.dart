import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/presentation/widgets/notification_list.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, dynamic>> data = [
    {
      'id': 1,
      'title': 'Good morning! Get 20% Voucher',
      'content': 'Summer sale up to 20% off. Limited voucher. Get now!! 😜',
      'isRead': false
    },
    {
      'id': 1,
      'title': 'Special offer just for you',
      'content': 'New Autumn Collection 30% off',
      'isRead': true
    },
    {
      'id': 1,
      'title': 'Holiday sale 50%',
      'content': 'Tap here to get 50% voucher.',
      'isRead': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBar(
        title: 'Notification',
      ),
      body: NotificationList(data: data),
    );
  }
}
