// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/signup_model/signup_model.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

import '../../../core/error/errors.dart';

class RegisterAPIController extends GetxController {
  final RxBool _isLoading = false.obs;

  get isLoading => _isLoading;

  Future<Either<Failure, SignUpModel>?> signUpAPI(String name, String email, String password, String birth) async {
    try {
      _isLoading.value = true;
      final response = await Dio().post(
        "https://lingo-pal-backend-v1.vercel.app/api/users/signup",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "birth_date": birth,
        },
        options: Options(
          headers: {"Accept": "application/json", "Content-Type": "application/json"},
        ),
      );
      if (response.statusCode == 200) {
        final signUpModel = SignUpModel.fromJson(response.data);
        _isLoading.value = false;
        Get.toNamed(RouteName.loginPage);
        return Right(signUpModel);
      } else {
        _isLoading.value = false;
        return Left(Failure(response.statusCode.toString()));
      }
    } on DioException catch (e) {
      _isLoading.value = false;
      String errorMessage;
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = "Connection timed out. Please check your network and try again.";
      } else if (e.type == DioExceptionType.sendTimeout) {
        errorMessage = "Request timed out while sending data. Please try again.";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = "Response timed out. Please check your connection and try again.";
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = "Failed to connect to the server. Please check your internet connection.";
      } else {
        errorMessage = e.message ?? "An unexpected error occurred.";
      }

      // Tampilkan modal error
      showError(e.response?.statusCode, errorMessage);
    } catch (e) {
      showError(0, e.toString());
    } finally {
      _isLoading.value = false;
    }
    return null;
  }
}
