import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "http://localhost:8000"; 

  static Future<bool> login({
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "role": role,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      // Demo logic if backend is unreachable
      return email.isNotEmpty && password.isNotEmpty;
    }
  }
}