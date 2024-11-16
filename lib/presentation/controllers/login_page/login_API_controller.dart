// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/core/error/errors.dart';
import 'package:lingo_pal_mobile/presentation/model/login_model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

class LoginAPIController extends GetxController {
  final _isLoading = RxBool(false);
  RxString emailName = "".obs;
  Rx<LoginModel?> login = Rx<LoginModel?>(null);
  RxBool get isLoading => _isLoading;
  Future<Either<Failure, LoginModel>> loginAPI(String email, String password) async {
    _isLoading.value = true;
    try {
      final response = await Dio().post(
        'https://lingo-pal-backend-v1.vercel.app/api/users/signin',
        data: {'email': email, 'password': password},
        options: Options(
          headers: {"Accept": "application/json", "Content-Type": "application/json"},
        ),
      );

      if (response.statusCode == 200) {
        final loginModel = LoginModel.fromJson(response.data);
        login(loginModel);
        emailName.value = loginModel.user?.email ?? "";
        Get.toNamed(RouteName.basePage);
        return Right(loginModel);
      } else {
        _isLoading.value = false;
        showError(response.statusCode, response.data['message']);
        return Left(Failure('Error ${response.statusCode}: ${response.data['message'] ?? 'Unknown error'}'));
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
      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      _isLoading.value = false;

      return Left(Failure('An unexpected error occurred'));
    }
  }
}
