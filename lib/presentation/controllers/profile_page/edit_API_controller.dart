// ignore_for_file: file_names

// import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
// import 'package:lingo_pal_mobile/core/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
// import 'package:lingo_pal_mobile/presentation/model/profile_model/edit_model.dart';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/error/errors.dart';

class EditAPIController extends GetxController {
  final RxBool _isLoading = false.obs;
  final _storage = const FlutterSecureStorage();
  final _controllerProfile = Get.find<GetProfileController>();

  get isLoading => _isLoading;
  Future editProfileAPI(String name, String birth, String image) async {
    var userId = await _storage.read(key: "userId");
    String? accessToken = await _storage.read(key: "token");
    try {
      _isLoading.value = true;
      final response = await Dio().post(
        "https://lingo-pal-backend-v1.vercel.app/api/users/update",
        data: {"user_id": userId, "name": name, "birth_date": birth, "image": image},
        options: Options(
          headers: {"Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer $accessToken"},
        ),
      );
      if (response.statusCode == 200) {
        // Success response
        _controllerProfile.update(); // Update profile data
      } else {
        // Handle unsuccessful responses (e.g., 400, 401, etc.)
        showError(response.statusCode, response.data['message']);
      }
      _controllerProfile.update();
    } on DioException catch (e) {
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
      _isLoading.value = false;
      // Tampilkan modal error
      showError(e.response?.statusCode, errorMessage);
    } catch (e) {
      _isLoading.value = false;
      showError(0, e.toString());
    } finally {
      _isLoading.value = false;
    }
    return null;
  }

  Future uploadImage(File imageFile, String? imageName) async {
    try {
      final response = await Supabase.instance.client.storage
          .from('lingo-pal-_storage/profiles/') // Replace with your _storage bucket name
          .upload(imageName ?? "img", imageFile);

      if (response.isNotEmpty) {
        final String publicUrl = Supabase.instance.client.storage.from('lingo-pal-_storage/profiles/').getPublicUrl(imageName ?? "");

        return publicUrl;
      }
    } catch (e) {
      return e;
    }
  }
}
