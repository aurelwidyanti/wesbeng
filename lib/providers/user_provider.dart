import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wesbeng/helpers/sp_helper.dart';
import 'package:wesbeng/models/user_model.dart';
import 'package:wesbeng/screens/auth/login_screen.dart';
import 'package:wesbeng/services/api_service.dart';

class UserProvider extends ChangeNotifier {
  ApiService apiService = ApiService();

  User? _user;

  User? get user => _user;

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  Future<void> fetchUserData(BuildContext context) async {
    _isFetching = true;
    notifyListeners();

    try {
      final response = await apiService.get('user');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _user = User.fromJson(data['data']);
      } else {
        clearUser();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (Route<dynamic> route) => false,
        );
      }
    } catch (e) {
      print('Failed to fetch user data: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  void clearUser() async {
    _user = null;
    await SharedPreferencesHelper.clearAccessToken();
    notifyListeners();
  }
}