// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/signup_model/singup_model.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

class RegisterAPIController extends GetxController {
  Future<Either<Failure, SignUp>> signUpAPI(String name, String email, String password, String phoneNumber, String birth, String gender) async {
    try {
      final response = await Dio().post(
        "https://lingo-pal-backend-v1.vercel.app/api/users/signup",
        data: {"name": name, "email": email, "password": password, "phone_number": phoneNumber, "birth_date": birth, "gender": gender},
        options: Options(
          headers: {"Accept": "application/json", "Content-Type": "application/json"},
        ),
      );
      final signUpModel = SignUp.fromJson(response.data);

      Get.toNamed(RouteName.loginPage);
      return Right(signUpModel);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        print("Error 401");
      }
      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      print("$e");
      return Left(Failure("$e"));
    }
  }
}
