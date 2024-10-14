// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/get_profile_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/profile_model/edit_model.dart';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditAPIController extends GetxController {
  var controllerProfile = Get.find<GetProfileController>();
  Future<Either<Failure, EditModel>> editProfileAPI(
      int userId, String name, String birth, String gender, String phoneNumber, String image) async {
    try {
      final response = await Dio().post(
        "https://lingo-pal-backend-v1.vercel.app/api/users/update",
        data: {
          "user_id": userId,
          "name": name,
          "phone_number": phoneNumber,
          "gender": gender,
          "birth_date": birth,
          "image": image
        },
        options: Options(
          headers: {"Accept": "application/json", "Content-Type": "application/json"},
        ),
      );
      final editModel = EditModel.fromJson(response.data);
      controllerProfile.update();
      return Right(editModel);
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

  Future uploadImage(File imageFile, String? imageName) async {
    try {
      final response = await Supabase.instance.client.storage
          .from('lingo-pal-storage/profiles/') // Replace with your storage bucket name
          .upload(imageName ?? "img", imageFile);

      if (response.isNotEmpty) {
        final String publicUrl =
            Supabase.instance.client.storage.from('lingo-pal-storage/profiles/').getPublicUrl(imageName ?? "");

        return publicUrl;
      }
    } catch (e) {}
  }
}
