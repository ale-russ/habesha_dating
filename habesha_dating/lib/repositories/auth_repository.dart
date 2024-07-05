import '/models/user_model.dart';
import '../../services/auth_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<DatingUser> login(String email, String password) async {
    return await _authService.login(email, password);
  }

  Future<DatingUser> register(
      String email, String password, String name) async {
    return await _authService.register(email, password, name);
  }
}
