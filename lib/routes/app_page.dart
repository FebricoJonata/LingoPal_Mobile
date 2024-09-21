import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/base_controller/base_binding.dart';
import 'package:lingo_pal_mobile/presentation/controllers/camera_controllers/camera_binding.dart';
import 'package:lingo_pal_mobile/presentation/controllers/dictionary_controller/dictionary_binding.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/home_bindings.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/practice_bindings.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_binding.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/profile_page_binding.dart';
import 'package:lingo_pal_mobile/presentation/controllers/quiz_controller/quiz_binding.dart';
import 'package:lingo_pal_mobile/presentation/view/base/base.dart';
import 'package:lingo_pal_mobile/presentation/controllers/landing_page_controller/landing_binding.dart';
import 'package:lingo_pal_mobile/presentation/view/camera_screen/camera_screen.dart';
import 'package:lingo_pal_mobile/presentation/view/dictionary_page/dictionary_page.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/home_page.dart';
import 'package:lingo_pal_mobile/presentation/view/home_page/practice_page/practice_page.dart';
import 'package:lingo_pal_mobile/presentation/view/landing_page/landing_page.dart';
import 'package:lingo_pal_mobile/presentation/view/login_page/login_page.dart';
import 'package:lingo_pal_mobile/presentation/controllers/register_page_controller/register_page_binding.dart';
import 'package:lingo_pal_mobile/presentation/view/profile_page/edit_page.dart';
import 'package:lingo_pal_mobile/presentation/view/profile_page/profile_page.dart';
import 'package:lingo_pal_mobile/presentation/view/quiz_page/multiple_choice/multiple_choice.dart';
import 'package:lingo_pal_mobile/presentation/view/quiz_page/voice_assesment/quiz_page.dart';
import 'package:lingo_pal_mobile/presentation/view/register_page/register_page.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteName.registerPage, page: () => const RegisterPage(), binding: RegisBindings()),
    GetPage(name: RouteName.basePage, page: () => const BasePage(), binding: BaseBindings()),
    GetPage(name: RouteName.landingPage, page: () => const LandingPage(), binding: LandingBindings()),
    GetPage(name: RouteName.loginPage, page: () => const LoginPage(), binding: LoginBindings()),
    GetPage(name: RouteName.homePage, page: () => const HomePage(), binding: HomeBindings()),
    GetPage(name: RouteName.practicePage, page: () => const PracticePage(), binding: PracticeBindings()),
    GetPage(name: RouteName.profilePage, page: () => const ProfilePage(), binding: ProfileBindings()),
    GetPage(name: RouteName.editPage, page: () => const EditPage(), binding: ProfileBindings()),
    GetPage(name: RouteName.camera2, page: () => const Camera2(), binding: CameraBinding()),
    GetPage(name: RouteName.quiz, page: () => const QuizPage(), binding: QuizBindings()),
    GetPage(name: RouteName.dictionary, page: () => const DictionaryPage(), binding: DictionaryBindings()),
    GetPage(name: RouteName.multipleChoice, page: () => const MutlipleChoice(), binding: QuizBindings())
  ];
}
