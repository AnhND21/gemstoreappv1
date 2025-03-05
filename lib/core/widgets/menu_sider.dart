import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstoreappv1/app.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/constants/SizedBoxEnum.dart';
import 'package:gemstoreappv1/main.dart';
import 'package:get/get.dart';

class MenuSider extends GetView<MyDrawerController> {
  const MenuSider({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = Get.find<GTabController>(); // Lấy instance
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.only(top: kToolbarHeight * 1.5),
        child: Column(
          children: <Widget>[
            // Header với avatar, tên và email
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://avatar.iran.liara.run/public', // Avatar ngẫu nhiên, mày thay bằng ảnh thật nếu muốn
                    ),
                  ),
                  15.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Sunie Pham',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'sunieux@gmail.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Dòng phân cách
            // const Divider(color: Colors.grey, thickness: 1),
            // Danh sách menu
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  _buildMenuItem(
                      icon: CupertinoIcons.home,
                      title: 'Home',
                      onTap: () {
                        controller.toggleDrawer();
                        tabController.changeTab(0);
                      },
                      isActive: tabController.selectedIndex.value == 0),
                  _buildMenuItem(
                      icon: CupertinoIcons.search,
                      title: 'Discover',
                      onTap: () {
                        controller.toggleDrawer();
                        tabController.changeTab(1);
                      },
                      isActive: tabController.selectedIndex.value == 1),
                  _buildMenuItem(
                      icon: CupertinoIcons.shopping_cart,
                      title: 'My Order',
                      onTap: () {
                        controller.toggleDrawer();
                        tabController.changeTab(2);
                      },
                      isActive: tabController.selectedIndex.value == 2),
                  _buildMenuItem(
                      icon: CupertinoIcons.person,
                      title: 'My profile',
                      onTap: () {
                        controller.toggleDrawer();
                        tabController.changeTab(3);
                      },
                      isActive: tabController.selectedIndex.value == 3),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'OTHER',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildMenuItem(
                    icon: CupertinoIcons.settings,
                    title: 'Setting',
                    onTap: () {
                      controller.toggleDrawer();
                      // Điều hướng tới Setting
                    },
                  ),
                  _buildMenuItem(
                    icon: CupertinoIcons.envelope,
                    title: 'Support',
                    onTap: () {
                      controller.toggleDrawer();
                      // Điều hướng tới Support
                    },
                  ),
                  _buildMenuItem(
                    icon: CupertinoIcons.info,
                    title: 'About us',
                    onTap: () {
                      controller.toggleDrawer();
                      // Điều hướng tới About us
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm tạo mục menu
  Widget _buildMenuItem(
      {required IconData icon,
      required String title,
      required VoidCallback onTap,
      bool isActive = false}) {
    // final isActive =
    return Ink(
      color: isActive ? Colors.blue : Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: isActive
            ? Color(GColors.blackColor)
            : Color(GColors.blackGrayColor)),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            // fontWeight: FontWeight.w600,
            color: isActive
                ? Color(GColors.blackColor)
                : Color(GColors.blackGrayColor),
          ),
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        // shape: isActive
        //     ? RoundedRectangleBorder(
        //         side: BorderSide(color: Color(GColors.blackColor), width: 2),
        //         borderRadius: BorderRadius.circular(8),
        //       )
        //     : null,
        // tileColor: isActive ? Colors.grey.shade100 : null,
      ),
    );
  }
}
