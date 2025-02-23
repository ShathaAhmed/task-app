import 'package:flutter/material.dart';
import 'package:tesk_app/core/api_service.dart';
import 'package:tesk_app/core/local_storage.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<bool> login(String username, String password) async {
    final response = await ApiService.login(username, password);
    if (response != null && response.containsKey('token')) {
      _isAuthenticated = true;
      await LocalStorage.saveToken(response['token']);
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() async {
    _isAuthenticated = false;
    await LocalStorage.clearToken();
    notifyListeners();
  }
}
