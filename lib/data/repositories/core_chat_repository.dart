import 'package:dio/dio.dart';
import 'package:panda_shop_app/data/services/api_path.dart';
import 'package:panda_shop_app/data/services/api_service.dart';

class CoreChatRepository {
  final ApiService _apiService = ApiService();

  Stream<String> postCoreChatStream({Map<String, dynamic>? data}) {
    return _apiService.postStream(APIPaths.pathCoreChat, data: data);
  }
}
