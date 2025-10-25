import 'package:dio/dio.dart';
import '../models/login_response.dart';

class AuthRepository {
  final Dio dio;
  AuthRepository(this.dio);

  Future<LoginResponse> login({required String email, required String password}) async {
    try {
      final response = await dio.post('/api/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        // If API returns JSON body
        if (response.data is Map<String, dynamic>) {
          final json = Map<String, dynamic>.from(response.data as Map);
          final model = LoginResponse.fromJson(json);

          // Some APIs return success flag; handle it
          if (model.success == false) {
            throw Exception(model.message ?? 'Login failed');
          }

          return model;
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final message = e.response?.data is Map<String, dynamic>
          ? (e.response?.data['message']?.toString() ?? e.message)
          : e.message;
      throw Exception('Network error: $message');
    }
  }
}