import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/profile_model/profile_model.dart';

class GetProfileController extends GetxController {
  var controllerLogin = Get.find<LoginAPIController>();
  Rx<Profile?> profile = Rx<Profile?>(null);
  Future<Either<Failure, Profile>> profileAPI() async {
    try {
      final response = await Dio().get(
        'https://lingo-pal-backend-v1.vercel.app/api/users',
        queryParameters: {'email': controllerLogin.name.value.toString()},
        options: Options(
          headers: {"Accept": "application/json"},
        ),
      );
      print("masih aman");
      var profileModel = Profile.fromJson(response.data);
      print("masih aman2");
      profile(profileModel);
      print("AHHAHAHAHAH ${response.data}");
      return Right(profileModel);
    } on DioException catch (e) {
      print("DioException: ${e.response?.statusCode}");
      if (e.response?.statusCode == 401) {
        print("Error 401");
      }
      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      return Left(Failure("$e"));
    }
  }

  @override
  void onInit() {
    super.onInit();
    profileAPI();
  }

  @override
  void onClose() {
    super.onClose();
    profileAPI();
  }
}
