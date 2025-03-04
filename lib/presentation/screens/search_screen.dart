import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/widgets/appbar.dart';

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
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
                  )),
                  GestureDetector(
                    child: Container(
                      child: Icon(Icons.list),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
