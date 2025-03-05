import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:gemstoreappv1/app.dart';
import 'package:gemstoreappv1/core/assets/colors.dart';
import 'package:gemstoreappv1/core/widgets/menu_sider.dart';
import 'routes/app_router.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Đăng ký MyDrawerController với GetX
    Get.put(MyDrawerController());
    Get.put(GTabController());
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router, // Sử dụng GoRouter
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'ProductSans'),
    );
  }
}

class MyHomePage extends GetView<MyDrawerController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      builder: (ctx) => ZoomDrawer(
        controller: ctx.zoomDrawerController,
        menuScreen: MenuSider(),
        mainScreen: AppRouterScreen(),
        borderRadius: 24.0,
        showShadow: true,
        angle: -8.0,
        drawerShadowsBackgroundColor: Colors.grey.shade300,
        menuBackgroundColor: Color(GColors.grayColor),
        slideWidth: MediaQuery.of(context).size.width * 0.75,
        style: DrawerStyle.defaultStyle,
        // Hoặc custom style
        overlayBlur: 1, // Màu lớp phủ
      ),
    );
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    print('Toggle drawer');
    zoomDrawerController.toggle?.call();
    update();
  }
}
