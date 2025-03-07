import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/assets/icons.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  final List<Map<String, dynamic>> trackingStatuses = [
    {
      'status': 'Parcel is successfully delivered',
      'time': '15 May 10:20',
      'isCompleted': true
    },
    {
      'status': 'Parcel is out for delivery',
      'time': '14 May 08:00',
      'isCompleted': true
    },
    {
      'status': 'Parcel is received at delivery Branch',
      'time': '13 May 17:25',
      'isCompleted': true
    },
    {
      'status': 'Parcel is in transit',
      'time': '13 May 07:00',
      'isCompleted': true
    },
    {
      'status': 'Sender has shipped your parcel',
      'time': '12 May 14:25',
      'isCompleted': true
    },
    {
      'status': 'Sender is preparing to ship your order',
      'time': '12 May 10:01',
      'isCompleted': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBar(
        title: 'Track Order',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivered on 15:05:21',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Tracking Number: IK27368838',
              style: TextStyle(fontSize: 14),
            ),
            32.height,
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: trackingStatuses.length,
              itemBuilder: (context, index) {
                final status = trackingStatuses[index];
                final isLast = index == trackingStatuses.length - 1;
                return TrackingStatusItem(
                  status: status['status'],
                  time: status['time'],
                  isCompleted: status['isCompleted'],
                  isLast: isLast,
                );
              },
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(GColors.whiteColor),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/icons/thumbsUp_icon.png',
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  32.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Don't forget to rate",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        4.height,
                        Text(
                          'Rate product to get 5 points for collect.',
                          style: TextStyle(
                              color: Color(GColors.blackGrayColor),
                              fontSize: 12),
                        ),
                        12.height,
                        Row(
                          children: List.generate(
                            5,
                            (starIndex) => Container(
                              margin: EdgeInsets.only(right: 8),
                              child: Icon(
                                CupertinoIcons.star_circle_fill,
                                size: 22,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TrackingStatusItem extends StatelessWidget {
  final String status;
  final String time;
  final bool isCompleted;
  final bool isLast;

  TrackingStatusItem({
    super.key,
    required this.status,
    required this.time,
    required this.isCompleted,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? Color(GColors.greenColor) : Colors.white,
              ),
              child: isCompleted
                  ? Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 32,
                color: Colors.grey,
                margin: EdgeInsets.symmetric(vertical: 4),
              ),
          ],
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                time,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
