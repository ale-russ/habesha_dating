import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final userProvider = StateNotifierProvider<UserNotifier, DatingUser?>(
    (ref) => UserNotifier(ref));

class UserNotifier extends StateNotifier<DatingUser?> {
  UserNotifier(this._ref) : super(null);

  final Ref _ref;

  Future<void> login(String email, String password) async {
    try {
      final user =
          await _ref.read(authRepositoryProvider).login(email, password);
      state = user;
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

  void logout() {
    state = null;
  }
}
