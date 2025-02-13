import 'package:dio/dio.dart';
import 'package:panda_shop_app/data/services/api_path.dart';
import 'package:panda_shop_app/data/services/api_service.dart';

class PhotoRepository {
  final ApiService _apiService = ApiService();

  Future<Response> getPhotos({Map<String, dynamic>? data}) async {
    try {
      final Response response =
          await _apiService.get(APIPaths.pathPhoto, queryParameters: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
