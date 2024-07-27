import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habesha_dating/providers/auth/form_validation_provider.dart';
import 'package:habesha_dating/providers/theme/theme_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';
import '../../utils/db_access.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authProvider =
    AsyncNotifierProvider<AuthNotifier, bool>(() => AuthNotifier());

class AuthNotifier extends AsyncNotifier<bool> {
  bool loginFailed = false;
  bool signUpFailed = false;
  @override
  FutureOr<bool> build() async {
    return isAuthenticated ?? false;
  }

  String? msg;

  Future<bool>? get isAuthenticated async => await _init();

  Future<bool> _init() async {
    try {
      if (await _isLoggedIn()) {
        await _loadUser();
        return true;
      }
      return false;
    } catch (err, stackTrace) {
      state = AsyncValue.error(err, stackTrace);
      return false;
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

  Future<bool> login(String email, String password) async {
    const AsyncValue.loading();
    try {
      final response =
          await ref.read(authRepositoryProvider).login(email, password);
      if (response.token != null) {
        state = const AsyncValue.data(true);
      } else {
        state = const AsyncValue.data(false);
        loginFailed = true;
      }
      msg = response.msg!;
    } catch (err, stackTrace) {
      state = AsyncValue.error(err, stackTrace);
      loginFailed = true;
      rethrow;
    }
    log("MSG: $msg");

    return state.value!;
  }

  Future<bool> register(
      String email, String password, String username, Uint8List? file) async {
    const AsyncValue.loading();
    try {
      final response = await ref
          .read(authRepositoryProvider)
          .register(email, password, username, file);
      if (response.userId != null) {
        state = const AsyncValue.data(true);
      } else {
        state = const AsyncValue.data(false);
        signUpFailed = true;
      }
      msg = response.msg!;
    } catch (err, stackTrace) {
      state = AsyncValue.error(err, stackTrace);
      signUpFailed = true;
      rethrow;
    }
    log("MSG: $msg");

    return state.value!;
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
    state = const AsyncValue.data(false);
  }
}
