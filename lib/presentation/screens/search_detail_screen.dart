import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/presentation/widgets/product_list_details.dart';
import 'package:go_router/go_router.dart';

class SearchDetailScreen extends StatefulWidget {
  const SearchDetailScreen({super.key});

  @override
  State<SearchDetailScreen> createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends State<SearchDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final extraData = state.extra as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBar(title: extraData?['item'], centerTitle: false),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Found\n150 Result',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                            color: Color(GColors.blackGrayColor), width: 2)),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Filter',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_drop_down_outlined)
                      ],
                    ),
                  ),
                )
              ],
            ),
            16.height,
            Expanded(child: ProductListDetails(data: []))
          ],
        ),
      ),
    );
  }
}
