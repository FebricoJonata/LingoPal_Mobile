import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/base_controller/base_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/chat_user_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/chatbot_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/tts_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/choice_chip_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/dictionary_controller/word_list_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/home_controllers/progress_course_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/material_controller/material_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/searchbar_controller.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController());
    Get.lazyPut(() => LoginAPIController());
    Get.lazyPut(() => ProgressAPIController());
    Get.lazyPut(() => GetProfileController());
    Get.lazyPut(() => CourseController());
    Get.lazyPut(() => ChatBotAPIController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => AudioController());
    Get.lazyPut(() => WordListController());
    Get.lazyPut(() => ChoicesController());
    Get.lazyPut(() => MaterialController());
    Get.lazyPut(() => SearchBarController());
  }
}
