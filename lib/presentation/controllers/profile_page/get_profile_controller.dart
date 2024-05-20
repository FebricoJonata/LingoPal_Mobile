import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/controllers/login_page/login_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/profile_model/profile_model.dart';

class GetProfileController extends GetxController {
  var controllerLogin = Get.find<LoginAPIController>();
  Rx<Profile?> profile = Rx<Profile?>(null);
  Future<Either<Failure, Profile>> profileAPI() async {
    print("User in profile controller: ${controllerLogin.emailName.value.toString()}");
    try {
      final response = await Dio().get(
        'https://lingo-pal-backend-v1.vercel.app/api/users',
        queryParameters: {'email': controllerLogin.emailName.value.toString()},
        options: Options(
          headers: {"Accept": "application/json"},
        ),
      );
      var profileModel = Profile.fromJson(response.data);
      print("profile aman");
      profile(profileModel);
      print("AHHAHAHAHAH ${response.data}");
      print("OI ${profile.value?.body?.data?.first.userId}");
      while (profile.value?.body?.data?.first.userId == null) {
        AsyncSnapshot.nothing();
      }
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
