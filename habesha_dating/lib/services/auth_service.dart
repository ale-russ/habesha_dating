import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import '/services/api_routes.dart';

class AuthService {
  Future<DatingUser> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.post(Uri.parse(loginRoute),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"email": email, "password": password}));

      if (response.statusCode == 200) {
        final user = datingUserFromJson(response.body);
        prefs.setString("userID", user.userId!);
        prefs.setString("token", user.token!);
        prefs.setString("userEmail", user.userEmail!);
        prefs.setBool("isLoggedIn", true);

        return user;
      } else {
        throw Exception(datingUserFromJson(response.body));
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<DatingUser> register(
      String email, String password, String userName) async {
    log("Email: $email, Password: $password, userName: $userName");
    try {
      final response = await http.post(
        Uri.parse(registerRoute),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            {"email": email, "password": password, "userName": userName}),
      );
      if (response.statusCode == 200) {
        return datingUserFromJson(response.body);
      } else {
        log("Response: ${response.body}");
        throw Exception(jsonDecode(response.body)['msg']);
      }
    } catch (err) {
      log('Error: $err');
      rethrow;
    }
  }
}
