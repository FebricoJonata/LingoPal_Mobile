import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/pages/register_page/register_page.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteName.registerPage, page: () => const RegisterPage()),
  ];
}
