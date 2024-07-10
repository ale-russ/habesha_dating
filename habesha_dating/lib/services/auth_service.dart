import 'dart:convert';
import 'dart:developer';
// import 'dart:developer';

import 'dart:typed_data';

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
        // log("ERror: ${(jsonDecode(response.body)['msg'])}");
        throw jsonDecode(response.body)['msg'];
      }
    } on Exception catch (err) {
      log("Error: $err");
      rethrow;
    }
  }

  Future<DatingUser> register(String email, String password, String userName,
      Uint8List? imageFile) async {
    try {
      final req = http.MultipartRequest("POST", Uri.parse(registerRoute));
      req.fields['email'] = email;
      req.fields['password'] = password;
      req.fields['userName'] = userName;

      req.files.add(http.MultipartFile.fromBytes(
          "profileImage", imageFile as List<int>,
          filename: "profileImage"));

      final res = await req.send();
      final response = await res.stream.bytesToString();

      if (res.statusCode == 200) {
        return datingUserFromJson(response);
      } else {
        throw Exception(jsonDecode(response)['msg']);
      }
    } catch (err) {
      rethrow;
    }
  }
}
