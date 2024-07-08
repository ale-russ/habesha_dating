import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNameProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final confirmPasswordProvider = StateProvider<String>((ref) => '');
final profileImageProvider = StateProvider<Uint8List?>((ref) => null);

final loginEmailProvider = StateProvider<String>((ref) => '');
final loginPasswordProvider = StateProvider<String>((ref) => '');

final isFormValidProvider = Provider<bool>((ref) {
  final userName = ref.watch(userNameProvider);
  final email = ref.watch(emailProvider);
  final password = ref.watch(passwordProvider);
  final confirmPassword = ref.watch(confirmPasswordProvider);
  final profileImage = ref.watch(profileImageProvider);

  final isEmailValid =
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  final isNameValid = RegExp(r'^[a-zA-Z]+$').hasMatch(userName);
  final isPasswordValid =
      RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
          .hasMatch(password);

  final isProfileImageValid = profileImage != null;

  return userName.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword &&
      isEmailValid &&
      isNameValid &&
      isPasswordValid &&
      isProfileImageValid;
});

final isLoginFormValidProvider = Provider.autoDispose<bool>((ref) {
  final email = ref.watch(emailProvider);
  final password = ref.watch(passwordProvider);

  final isEmailValid =
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  final isPasswordValid = password.length > 5;

  return email.isNotEmpty && isEmailValid && isPasswordValid;
});

class TextNotifier extends StateNotifier<String> {
  TextNotifier() : super('');
  void updateText(String text) {
    state = text;
  }
}
