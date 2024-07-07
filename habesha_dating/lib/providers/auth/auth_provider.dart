import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final userProvider = StateNotifierProvider<UserNotifier, DatingUser?>(
    (ref) => UserNotifier(ref));

class UserNotifier extends StateNotifier<DatingUser?> {
  UserNotifier(this._ref) : super(null);

  final Ref _ref;

  bool isLoggedIn = false;

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userID");
    final token = prefs.getString("token");
    final userEmail = prefs.getString("userEmail");
    isLoggedIn = (prefs.getBool("isLoggedIn"))!;

    if (userId == null && token != null && userEmail != null) {
      state = DatingUser(
          msg: "", userId: userId, token: token, userEmail: userEmail);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final user =
          await _ref.read(authRepositoryProvider).login(email, password);
      state = user;
      _loadUser();
      log('User: ${user.msg}');
    } catch (err) {
      log('AUTH ERROR: $err');
      state = null;
      rethrow;
    }
  }

  Future<void> register(String email, String password, String username) async {
    try {
      final user = await _ref
          .read(authRepositoryProvider)
          .register(email, password, username);
      state = user;
    } catch (err) {
      state = null;
      rethrow;
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("userID");
    prefs.remove("token");
    prefs.remove("userEmail");
    prefs.setBool("isLoggedIn", false);
    state = null;
  }
}
