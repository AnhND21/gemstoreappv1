import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';
import 'package:gemstoreappv1/presentation/widgets/product_list_horizontal.dart';
import 'package:gemstoreappv1/presentation/widgets/recent_search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GColors.whiteColor),
      appBar: GAppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
          // padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
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
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        // controller: _password,
                        // onChanged: (value) {
                        //   _password.value = TextEditingValue(
                        //       text: value,
                        //       selection: _password.selection);
                        // },
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            // Chỉ chiếm không gian tối thiểu
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  CupertinoIcons.search,
                                  size: 22,
                                ),
                              ),
                              SizedBox(width: 8),
                              // Thêm khoảng cách 8px giữa icon và hintText
                            ],
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 0,
                            // Đảm bảo có đủ khoảng cách tối thiểu cho icon
                            minHeight: 0,
                          ),
                          isDense: true,
                          hintStyle: TextStyle(
                            height: 1,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          hintText: 'Search anything...',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    )),
                    16.width,
                    GestureDetector(
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
                        child: Icon(Icons.filter_list_outlined),
                      ),
                    )
                  ],
                ),
              ),
              RecentSearch(data: [], title: 'Recent searches'),
              ProductListHorizontal(data: [], title: 'Popular this week',)
            ],
          ),
        ),
      ),
    );
  }
}
