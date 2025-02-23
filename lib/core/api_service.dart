import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tesk_app/core/local_storage.dart';

class ApiService {
  static const String baseUrl = "https://dummyjson.com";

  /// تسجيل الدخول وإرجاع بيانات المستخدم
  static Future<Map<String, dynamic>?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await LocalStorage.saveToken(data['token']);
      return data;
    } else {
      return null;
    }
  }

  /// جلب المهام مع الترقيم الصفحي
  static Future<List<Map<String, dynamic>>> fetchTasks(int limit, int skip) async {
    final response = await http.get(Uri.parse("$baseUrl/todos?limit=$limit&skip=$skip"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['todos']);
    } else {
      return [];
    }
  }

  /// إضافة مهمة جديدة
  static Future<Map<String, dynamic>?> addTask(String title) async {
    final token = await LocalStorage.getToken();
    final response = await http.post(
      Uri.parse("$baseUrl/todos/add"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({"todo": title, "completed": false, "userId": 1}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  /// حذف المهمة
  static Future<bool> deleteTask(int id) async {
    final token = await LocalStorage.getToken();
    final response = await http.delete(
      Uri.parse("$baseUrl/todos/$id"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    return response.statusCode == 200;
  }
}
