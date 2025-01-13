import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';


import 'package:lingo_pal_mobile/presentation/model/profile_model/profile_model.dart';


class GetProfileController extends GetxController {
  // var controllerLogin = Get.find<LoginAPIController>();
  Rx<Profile?> profile = Rx<Profile?>(null);
  var storage = const FlutterSecureStorage();
  Future profileAPI() async {
    var email = await storage.read(key: "email");
    String? accessToken = await storage.read(key: "token");
    try {
      final response = await Dio().get(
        'https://lingo-pal-backend-v1.vercel.app/api/users',
        queryParameters: {'email': email},
        options: Options(
          headers: {"Accept": "application/json", "Authorization": "Bearer $accessToken"},
        ),
      );
      var profileModel = Profile.fromJson(response.data);

      profile(profileModel);
      // return Right(profileModel);
    } on DioException catch (e) {
      print("DioException: ${e.response?.statusCode}");
      if (e.response?.statusCode == 401) {
        print("Error 401");
      }
      // return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      // return Left(Failure("$e"));
    }
  }

  @override
  void onInit() {
    super.onInit();
    profileAPI();
  }
}
