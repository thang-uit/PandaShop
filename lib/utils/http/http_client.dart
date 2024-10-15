import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:panda_shop_app/common/flavor/Flavor.dart';

class HttpHelper {
  static String baseUrl = Flavor.baseURL;

  static Future<Map<String, dynamic>> get(String endPoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endPoint'));
    return handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(
      String endPoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endPoint'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode(data),
    );
    return handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(String endPoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endPoint'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode(data),
    );
    return handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String endPoint) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endPoint'));
    return handleResponse(response);
  }

  static Map<String, dynamic> handleResponse(http.Response? response) {
    if (response != null) {
      if (200 == response.statusCode && response.body != null) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } else {
      throw Exception('response null');
    }
  }
}
