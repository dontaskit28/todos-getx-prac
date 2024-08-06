import 'package:http/http.dart' as http;

class HttpService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<http.Response?> get(String endPoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endPoint'));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> post(String url, dynamic data) async {
    // Your implementation
  }

  static Future<dynamic> put(String url, dynamic data) async {
    // Your implementation
  }

  static Future<dynamic> delete(String url) async {
    // Your implementation
  }
}
