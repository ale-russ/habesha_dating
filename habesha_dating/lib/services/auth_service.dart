import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../models/user_model.dart';
import '/services/api_routes.dart';

class AuthService {
  Future<DatingUser> login(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(loginRoute),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"email": email, "password": password}));

      if (response.statusCode == 200) {
        return datingUserFromJson(response.body);
      } else {
        // log("RESPONSE: ${response.body}");
        throw Exception(jsonDecode(response.body)['msg']);
      }
    } on Exception catch (err) {
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
