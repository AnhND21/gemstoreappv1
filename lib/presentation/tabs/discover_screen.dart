import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar_tab.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<Map<String, dynamic>> discoverList = [
    {
      'id': 2,
      'title': 'Clothing',
      'image': 'assets/images/clothing.png',
      'color': 0xFFA3A798
    },
    {
      'id': 1,
      'title': 'Accessories',
      'image': 'assets/images/accessories.png',
      'color': 0xFF898280
    },
    {
      'id': 3,
      'title': 'Shoes',
      'image': 'assets/images/shoes2.png',
      'color': 0xFF44565C
    },
    {
      'id': 5,
      'title': 'Collection',
      'image': 'assets/images/collections.png',
      'color': 0xFFB9AEB2
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBarTab(
        title: 'Discover',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: SizedBox(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.search);
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(GColors.inputBackgroundColor),
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
                        child: Row(
                          children: <Widget>[
                            Icon(CupertinoIcons.search),
                            SizedBox(
                              width: 4,
                            ),
                            Text('Search...')
                          ],
                        ),
                      ),
                    ),
                  ),
                  16.width,
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(GColors.inputBackgroundColor),
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
                    child: Icon(Icons.filter_list_outlined),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                children: discoverList.asMap().entries.map((data) {
                  final item = data.value;
                  final index = data.key;
                  return Container(
                    height: 125,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: Color(item['color']),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            item['title'],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(GColors.whiteColor)),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                                child: Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(GColors.whiteColor)
                                      .withOpacity(0.3)),
                            )),
                            Positioned(
                                child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(GColors.whiteColor)
                                      .withOpacity(0.5)),
                            )),
                            Image.asset(
                              item['image'],
                              width: 126,
                              height: 149,
                              fit: index == 0 ? BoxFit.cover : BoxFit.contain,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
