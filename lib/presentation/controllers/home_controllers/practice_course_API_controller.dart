import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:lingo_pal_mobile/presentation/model/home_model/practice_model.dart';

class PracticeCourseController extends GetxController {
  Rx<PracticeModel?> practices = Rx<PracticeModel?>(null);
  
  Future<Either<Failure, PracticeModel>> getPractices(courseId) async {
    try {
      final response = await Dio().get(
        'https://lingo-pal-backend-v1.vercel.app/api/practice',
        queryParameters: {'course_id': courseId},
        options: Options(
          headers: {"Accept": "application/json"}
        )
      );

      var practiceModel = PracticeModel.fromJson(response.data);
      practices(practiceModel);
      print("Success");
      print(practices);

      return Right(practiceModel);
    } catch (e) {
      print("Error");
      return Left(Failure("$e"));
    }
  }

  @override
  void onInit(){
    super.onInit();
    // getPractices();
  }

  @override
  void onClose(){
    super.onClose();
    // getPractices();
  }
  
}

// class ProgressAPIController extends GetxController {
//   var controllerLogin = Get.find<LoginAPIController>(); // buat manggil controller lain
//   Rx<ProgressUserModel?> progress = Rx<ProgressUserModel?>(null); // variabel buat dipanggil di ui
//   Future<Either<Failure, ProgressUserModel>> getProgress() async { // function buat fetch
//     try {
//       final response = await Dio().get( // jenis api nya
//         'https://lingo-pal-backend-v1.vercel.app/api/users/status', // url
//         queryParameters: {'user_id': controllerLogin.login.value?.user?.userId}, // param/filter
//         options: Options( // header - liat di api apa ada "-H" nya
//           headers: {"Accept": "application/json"},
//         ),
//       );

//       var progressModel = ProgressUserModel.fromJson(response.data); // masukin response ke variabel model
//       print("AMAN BANG");
//       progress(progressModel); // masukin model ke variabel buat dipanggil di ui
//       print(response.data);
//       return Right(progressModel); // return data
//     } on DioException catch (e) { // kalau gagal ambil data
//       print("Ga AMAN COK");
//       print("DioException: ${e.response?.statusCode}");
//       if (e.response?.statusCode == 401) { // error
//         print("Error 401");
//       }
//       return Left(Failure('Error: ${e.message}'));
//     } catch (e) {
//       return Left(Failure("$e")); // error
//     }
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     getProgress();
//   }

//   @override
//   void onClose() {
//     // TODO: implement onClose
//     super.onClose();
//     getProgress();
//   }
// }