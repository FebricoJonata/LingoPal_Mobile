import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/base_controller/base_binding.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_binding.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/profile_page_binding.dart';
import 'package:lingo_pal_mobile/presentation/view/base/base.dart';
import 'package:lingo_pal_mobile/presentation/controllers/landing_page_controller/landing_binding.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/home_page.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/practice_page.dart';
import 'package:lingo_pal_mobile/presentation/view/landing_page/landing_page.dart';
import 'package:lingo_pal_mobile/presentation/view/login_page/login_page.dart';
import 'package:lingo_pal_mobile/presentation/controllers/register_page_controller/register_page_binding.dart';
import 'package:lingo_pal_mobile/presentation/view/profile_page/edit_page.dart';
import 'package:lingo_pal_mobile/presentation/view/profile_page/profile_page.dart';
import 'package:lingo_pal_mobile/presentation/view/register_page/register_page.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteName.registerPage, page: () => const RegisterPage(), binding: RegisBindings()),
    GetPage(name: RouteName.basePage, page: () => const BasePage(), binding: BaseBindings()),
    GetPage(name: RouteName.landingPage, page: () => const LandingPage(), binding: LandingBindings()),
    GetPage(name: RouteName.loginPage, page: () => const LoginPage(), binding: LoginBindings()),
    GetPage(name: RouteName.homePage, page: () => const HomePage()),
    GetPage(name:RouteName.practicePage, page: () => const PracticePage()),
    GetPage(name: RouteName.profilePage, page: () => const ProfilePage(), binding: ProfileBindings()),
    GetPage(name: RouteName.editPage, page: () => const EditPage(), binding: ProfileBindings())
  ];
}
