import 'package:gemstoreappv1/main.dart';
import 'package:gemstoreappv1/presentation/screens/check_out_screen.dart';
import 'package:gemstoreappv1/presentation/screens/forgot_password_screen.dart';
import 'package:gemstoreappv1/presentation/screens/introduce_screen.dart';
import 'package:gemstoreappv1/presentation/screens/my_cart_screen.dart';
import 'package:gemstoreappv1/presentation/screens/payment_success_screen.dart';
import 'package:gemstoreappv1/presentation/screens/product_detail_screen.dart';
import 'package:gemstoreappv1/presentation/screens/search_detail_screen.dart';
import 'package:gemstoreappv1/presentation/screens/search_screen.dart';
import 'package:gemstoreappv1/presentation/screens/select_payment_screen.dart';
import 'package:gemstoreappv1/presentation/screens/signin_screen.dart';
import 'package:gemstoreappv1/presentation/screens/signup_screen.dart';
import 'package:gemstoreappv1/presentation/screens/welcome_screen.dart';
import 'package:gemstoreappv1/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.appStack,
  routes: [
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.introduce,
      builder: (context, state) => IntroduceScreen(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: AppRoutes.signin,
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (context, state) => ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.appStack,
      builder: (context, state) => MyHomePage(),
    ),
    GoRoute(
      path: AppRoutes.search,
      builder: (context, state) => SearchScreen(),
    ),
    GoRoute(
      path: AppRoutes.searchDetails,
      builder: (context, state) => SearchDetailScreen(),
    ),
    GoRoute(
      path: AppRoutes.productDetails,
      builder: (context, state) => ProductDetailScreen(),
    ),
    GoRoute(
      path: AppRoutes.myCart,
      builder: (context, state) => MyCartScreen(),
    ),
    GoRoute(
      path: AppRoutes.checkOutScreen,
      builder: (context, state) => CheckOutScreen(),
    ),
    GoRoute(
      path: AppRoutes.selectPaymentScreen,
      builder: (context, state) => SelectPaymentScreen(),
    ),
    GoRoute(
      path: AppRoutes.paymentSuccessScreen,
      builder: (context, state) => PaymentSuccessScreen(),
    ),
  ],
);
