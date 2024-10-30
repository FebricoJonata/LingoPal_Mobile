// ignore_for_file: file_names
// ignore: unused_import

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/material_model/material_model.dart';

class MaterialController extends GetxController {
  Rx<MaterialModel?> materials = Rx<MaterialModel?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  // var controllerMaterialChip = Get.find<ChoiceMaterialController>();/
  var searches = "".obs;

  Future<Either<Failure, MaterialModel>> getMaterials(filter, searches) async {
    if (filter == "All") {
      filter = "";
    }
    try {
      final response = await Dio()
          .get('https://lingo-pal-backend-v1.vercel.app/api/material-resource', options: Options(headers: {'accept': 'application/json'}), queryParameters: {"type": filter, "search": searches});
      var materialModel = MaterialModel.fromJson(response.data);
      materials(materialModel);
      return Right(materialModel);
    } on DioException catch (e) {
      print(e);
      return Left(Failure("$e"));
    } catch (e) {
      print("Error material: $e");
      return Left(Failure("$e"));
    } finally {
      isLoading.value = false;
    }
  }
}
