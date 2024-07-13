import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final userProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<DatingUser?>>(
        (ref) => UserNotifier(ref));

class UserNotifier extends StateNotifier<AsyncValue<DatingUser?>> {
  UserNotifier(this._ref) : super(const AsyncValue.loading()) {
    _init();
  }

  final Ref _ref;

  Future<void> _init() async {
    try {
      await loginStatus();
      if (await _isLoggedIn()) {
        await _loadUser();
      } else {
        state = const AsyncValue.data(null);
      }
    } catch (err, stackTrace) {
      state = AsyncValue.error(err, stackTrace);
    }
  }

  Future<bool> _isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    log('isLoggedIN in provider: $isLoggedIn');
    return isLoggedIn;
  }

  Future<void> loginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    log('ISLOGGEDD IN: $isLoggedIn');
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userID");
    final token = prefs.getString("token");
    final userEmail = prefs.getString("userEmail");

    if (userId != null && token != null && userEmail != null) {
      state = AsyncValue.data(DatingUser(
        msg: "",
        userId: userId,
        token: token,
        userEmail: userEmail,
      ));
    } else {
      state = const AsyncValue.data(null);
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user =
          await _ref.read(authRepositoryProvider).login(email, password);
      await _saveUser(user);
      state = AsyncValue.data(user);
    } catch (err, stackTrace) {
      state = AsyncValue.error(err, stackTrace);
      rethrow;
    }
  }

  Future<void> register(
      String email, String password, String username, Uint8List? file) async {
    state = const AsyncValue.loading();
    try {
      final user = await _ref
          .read(authRepositoryProvider)
          .register(email, password, username, file);
      await _saveUser(user);
      state = AsyncValue.data(user);
    } catch (err, stackTrace) {
      state = AsyncValue.error(err, stackTrace);
      rethrow;
    }
  }

  Future<void> _saveUser(DatingUser user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("userID", user.userId!);
    await prefs.setString("token", user.token!);
    await prefs.setString("userEmail", user.userEmail!);
    await prefs.setBool("isLoggedIn", true);
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("userID");
    await prefs.remove("token");
    await prefs.remove("userEmail");
    await prefs.setBool("isLoggedIn", false);
    state = const AsyncValue.data(null);
  }
}
