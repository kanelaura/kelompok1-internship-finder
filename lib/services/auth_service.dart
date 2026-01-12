import '../services/api_service.dart';

class AuthService {
  static final ApiService _apiService = ApiService();

  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    try {
      final response = await _apiService.post(
        '/user/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      // Response structure: { "success": true, "data": { "user": {...}, "token": "..." } }
      if (response['success'] == true && response['data'] != null) {
        final token = response['data']['token'];
        if (token != null) {
          await _apiService.saveToken(token);
        }
        return {'success': true, 'data': response['data']};
      }

      return {
        'success': false,
        'message': response['message'] ?? 'Login gagal'
      };
    } catch (e) {
      return {'success': false, 'message': _getErrorMessage(e)};
    }
  }

  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiService.post(
        '/user/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      // Response structure: { "success": true, "data": { "user": {...}, "token": "..." } }
      if (response['success'] == true && response['data'] != null) {
        final token = response['data']['token'];
        if (token != null) {
          await _apiService.saveToken(token);
        }
        return {'success': true, 'data': response['data']};
      }

      return {
        'success': false,
        'message': response['message'] ?? 'Register gagal'
      };
    } catch (e) {
      return {'success': false, 'message': _getErrorMessage(e)};
    }
  }

  static Future<void> logout() async {
    try {
      await _apiService.post('/user/logout');
    } catch (e) {
      print('Logout error: $e');
    } finally {
      await _apiService.clearToken();
    }
  }

  static Future<Map<String, dynamic>?> getProfile() async {
    try {
      final response = await _apiService.get('/user/profile');

      // Response structure: { "success": true, "data": { "id": 1, "name": "...", "email": "..." } }
      if (response['success'] == true && response['data'] != null) {
        return response['data'];
      }
      return null;
    } catch (e) {
      print('Get profile error: $e');
      return null;
    }
  }

  static Future<bool> isLoggedIn() async {
    final token = await _apiService.getToken();
    return token != null && token.isNotEmpty;
  }

  static String _getErrorMessage(dynamic error) {
    final errorStr = error.toString();
    if (errorStr.contains('Exception: ')) {
      return errorStr.replaceAll('Exception: ', '');
    }
    if (errorStr.contains('Unauthorized')) {
      return 'Sesi Anda telah berakhir. Silakan login kembali.';
    }
    if (errorStr.contains('SocketException')) {
      return 'Tidak dapat terhubung ke server. Pastikan server Laravel berjalan.';
    }
    return 'Terjadi kesalahan. Silakan coba lagi.';
  }
}
