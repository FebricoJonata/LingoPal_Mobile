import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/pages/home_page/home.dart';
import 'package:lingo_pal_mobile/presentation/pages/landing_page/controller/landing_binding.dart';
import 'package:lingo_pal_mobile/presentation/pages/landing_page/landing_page.dart';
import 'package:lingo_pal_mobile/presentation/pages/login_page/login_page.dart';
import 'package:lingo_pal_mobile/presentation/pages/register_page/register_page.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteName.registerPage, page: () => const RegisterPage()),
    GetPage(name: RouteName.homePage, page: () => const HomePage()),
    GetPage(name: RouteName.landigPage, page: () => const LandingPage(), binding: LandingBindings()),
    GetPage(name: RouteName.loginPage, page: () => const LoginPage())
  ];
}
