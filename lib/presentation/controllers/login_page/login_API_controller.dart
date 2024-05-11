import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
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
      final loginModel = LoginModel.fromJson(response.data);
      login(loginModel);
      emailName.value = loginModel.user?.email ?? "";
      print("Response code login ${response}");
      Get.toNamed(RouteName.basePage);
      return Right(loginModel);
    } on DioException catch (e) {
      _isLoading.value = false;
      print("errorExp");
      if (e.response?.statusCode == 401) {
        print("Error 401");
      }
      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      _isLoading.value = false;
      print("Error");
      return Left(Failure('An unexpected error occurred'));
    }
  }
}
