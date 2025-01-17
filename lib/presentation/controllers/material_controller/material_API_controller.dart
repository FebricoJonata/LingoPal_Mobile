// ignore_for_file: file_names
// ignore: unused_import

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/material_model/material_model.dart';

class MaterialController extends GetxController {
  final Rx<MaterialModel?> _materials = Rx<MaterialModel?>(null);
  final _isLoading = false.obs;
  final _errorMessage = ''.obs;
  final _storage = const FlutterSecureStorage();

  get materials => _materials;
  get errorMessage => _errorMessage;
  get isLoading => _isLoading;

  Future<Either<Failure, MaterialModel>> getMaterials(String? filter, String searches) async {
    printError(info: searches);
    if (filter == "All" || filter == null) {
      filter = "";
    }
    String? accessToken = await _storage.read(key: "token");
    try {
      _isLoading.value = true;
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/material-resource',
          options: Options(headers: {'accept': 'application/json', "Authorization": "Bearer $accessToken"}), queryParameters: {"type": filter, "search": searches});
      var materialModel = MaterialModel.fromJson(response.data);
      _materials(materialModel);
      return Right(materialModel);
    } on DioException catch (e) {
      print(e);
      return Left(Failure("$e"));
    } catch (e) {
      print("Error material: $e");
      _errorMessage.value = e.toString();
      return Left(Failure("$e"));
    } finally {
      _isLoading.value = false;
    }
  }
}
