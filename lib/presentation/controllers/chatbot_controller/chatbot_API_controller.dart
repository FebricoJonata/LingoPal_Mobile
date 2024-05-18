import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:lingo_pal_mobile/core/color/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:lingo_pal_mobile/presentation/model/chatbot_model/chatbot_response_model.dart';
import 'package:lingo_pal_mobile/presentation/view/components/alert.dart';

class ChatBotAPIController extends GetxController {
  final _isLoading = RxBool(false);
  Rx<ChatBotResponse?> chatbotReponse = Rx<ChatBotResponse?>(null);
  RxBool get isLoading => _isLoading;

  Future<Either<Failure, ChatBotResponse>> chatBotAPI(String message) async {
    _isLoading.value = true;
    final requestBody = {
      "conversation": [
        {
          "role": "user",
          "content": message,
        }
      ]
    };
    try {
      final response = await Dio().post(
        'https://lingo-pal-backend-v1.vercel.app/api/chat/chat-completion',
        data: requestBody,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
      );
      final chatBotResponseModel = ChatBotResponse.fromJson(response.data);
      chatbotReponse(chatBotResponseModel);
      print("Chatbot Response: ${chatBotResponseModel}");
      return Right(chatBotResponseModel);
    } on DioException catch (e) {
      _isLoading.value = false;
      showError(e.message);
      print("DioException: ${e.message}");
      return Left(Failure('Error: ${e.message}'));
    } catch (e) {
      _isLoading.value = false;
      print("General Exception: $e");
      return Left(Failure('An unexpected error occurred'));
    } finally {
      _isLoading.value = false;
    }
  }

  void showError(String? message) {
    Get.dialog(
      Alert(
        imagePath: "assets/images/robots/cool.png",
        title: "Error!",
        message: message ?? "An unexpected error occurred",
        onClose: () async {},
      ),
    );
  }
}
