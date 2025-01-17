import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/signup_model/email_verif_model.dart';

import '../../../core/error/errors.dart';

class EmailVerifController extends GetxController {
  final RxBool _isLoading = false.obs;
  final RxInt _istap = 0.obs;
  final _countdown = 0.obs;
  final _storage = const FlutterSecureStorage();

  get istap => _istap;
  get countdown => _countdown;

  Future<Either<Failure, EmailVerifModel>?> emailVerification(String email) async {
    String? accessToken = await _storage.read(key: "token");
    try {
      final response = await Dio().post(
        "https://lingo-pal-backend-v1.vercel.app/api/mail/send-verification",
        data: {"to": email, "verificationUrl": "https://lingo-pal-backend-v1.vercel.app/api/users/verify-account?email=$email"},
        options: Options(
          headers: {"Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer $accessToken"},
        ),
      );
      if (response.statusCode == 200) {
        final emailVerifModel = EmailVerifModel.fromJson(response.data);
        _isLoading.value = false;
        return Right(emailVerifModel);
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
