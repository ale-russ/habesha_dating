import 'dart:developer';
import 'dart:typed_data';

import '/models/user_model.dart';
import '../../services/auth_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<DatingUser> login(String email, String password) async {
    return await _authService.login(email, password);
  }

  Future<DatingUser> register(
      String email, String password, String name, Uint8List? imageFile) async {
    return await _authService.register(email, password, name, imageFile);
  }

  Future<List<String>> fetchImageUrl() async {
    return await _authService.fetchImages();
  }
}
