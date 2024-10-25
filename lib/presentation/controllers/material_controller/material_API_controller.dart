import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/material_model/material_model.dart';

class MaterialController extends GetxController {
  Rx<MaterialModel?> materials = Rx<MaterialModel?>(null);

  Future<Either<Failure, MaterialModel>> getMaterials() async {
    try {
      final response = await Dio().get('https://lingo-pal-backend-v1.vercel.app/api/material-resource', options: Options(headers: {'accept' : 'application/json'}));
      var materialModel = MaterialModel.fromJson(response.data);
      materials(materialModel);
      return Right(materialModel);

    } catch(e) {
      print("Error material: $e");
      return Left(Failure("$e"));
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
