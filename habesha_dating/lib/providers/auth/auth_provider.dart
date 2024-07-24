import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habesha_dating/providers/theme/theme_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';
import '../../utils/db_access.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authController = AsyncNotifierProvider<AuthController, DatingUser?>(() {
  return AuthController();
});

class AuthController extends AsyncNotifier<DatingUser?> {
  @override
  FutureOr<DatingUser?> build() async {
    return await _init();
  }

  DatingUser? _user;

  Future<void> login(String email, String password) async {
    try {
      final authRepository = ref.read(authRepositoryProvider);
      state = const AsyncLoading();
      _user = await authRepository.login(email, password);
      state = AsyncValue.data(_user);
      await _saveUser(_user!);
    } catch (err, stackTrace) {
      state = AsyncValue.error(err, stackTrace);
      rethrow;
    }
  }

  Future<DatingUser?> _init() async {
    try {
      if (await _isLoggedIn()) {
        return await _loadUser();
      }
      return null;
    } catch (err, stackTrace) {
      state = AsyncValue.error(err, stackTrace);
      return null;
    }
  }

  Future<bool> _isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    log('isLoggedIn in provider: $isLoggedIn');
    return isLoggedIn;
  }

  Future<DatingUser?> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userID");
    final token = prefs.getString("token");
    final userEmail = prefs.getString("userEmail");

    if (userId != null && token != null && userEmail != null) {
      return DatingUser(
        msg: "",
        userId: userId,
        token: token,
        userEmail: userEmail,
      );
    }
    return null;
  }

  Future<void> register(
      String email, String password, String username, Uint8List? file) async {
    state = const AsyncValue.loading();
    try {
      final authRepository = ref.read(authRepositoryProvider);
      _user = await authRepository.register(email, password, username, file);
      state = AsyncValue.data(_user);
      await DbAccess.userDB.putAll({
        "email": email,
        "user_password": password,
      });
      await _saveUser(_user!);
    } catch (err, stackTrace) {
      state = AsyncValue.error(err, stackTrace);
      rethrow;
    }
  }

  Future<void> _saveUser(DatingUser user) async {
    await DbAccess.userDB.putAll({
      "token": user.token,
      "userId": user.userId!,
      "isLoggedIn": true,
    });

    final themeMode = ref.read(themeProvider);
    await DbAccess.userDB.put("isDarkMode", themeMode == ThemeMode.dark);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("userID");
    await prefs.remove("token");
    await prefs.remove("userEmail");
    await prefs.setBool("isLoggedIn", false);
    state = const AsyncValue.data(null);
  }
}
