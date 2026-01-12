import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Future<Map<String, String>> getHeaders() async {
    final token = await getToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // GET request
  Future<dynamic> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    print('🌐 GET $baseUrl$endpoint');
    final headers = await getHeaders();

    var uri = Uri.parse('$baseUrl$endpoint');
    if (queryParameters != null) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    final response = await http.get(uri, headers: headers);
    return _handleResponse(response);
  }

  // POST request
  Future<dynamic> post(String endpoint, {dynamic data}) async {
    print('🌐 POST $baseUrl$endpoint');
    print('📦 Data: $data');
    final headers = await getHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // PUT request
  Future<dynamic> put(String endpoint, {dynamic data}) async {
    print('🌐 PUT $baseUrl$endpoint');
    final headers = await getHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // DELETE request
  Future<dynamic> delete(String endpoint) async {
    print('🌐 DELETE $baseUrl$endpoint');
    final headers = await getHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    print('✅ Response [${response.statusCode}]: ${response.body}');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      // Token expired/invalid
      clearToken();
      throw Exception('Unauthorized');
    } else {
      final errorBody = json.decode(response.body);
      final message = errorBody['message'] ?? 'Error: ${response.statusCode}';
      throw Exception(message);
    }
  }
}
