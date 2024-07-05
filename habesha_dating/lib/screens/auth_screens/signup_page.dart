import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habesha_dating/providers/auth/auth_provider.dart';

import '../../providers/form_validation_provider.dart';
import '/widgets/auth_widgets/auth_heading.dart';
import '../../providers/theme_provider.dart';
import '/widgets/common/custom_appbar.dart';
import '/widgets/common/custom_text_field.dart';
import '/widgets/auth_widgets/login_button.dart';
import '../../themes/app_colors.dart';
import '/widgets/or_spacer.dart';
import '/widgets/auth_widgets/social_icons.dart';

// ignore: must_be_immutable
class SignupPage extends ConsumerWidget {
  SignupPage({
    super.key,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();
  TextEditingController? nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: themeMode == ThemeMode.dark
          ? AppColors.darkAddIconBorderColor
          : AppColors.secondaryLight,
      appBar: const CustomAppBar(),
      body: Form(
        child: Column(
          children: [
            const AuthHeading(
              label: 'Sign up with Email',
              isLogin: false,
            ),
            const SocialIcons(),
            const SizedBox(height: 30),
            const OrSpacer(),
            const SizedBox(height: 30),
            CustomTextForm(
              controller: nameController!,
              labelText: 'Your Name',
              onChanged: (text) =>
                  ref.read(userNameProvider.notifier).state = text,
            ),
            CustomTextForm(
              controller: emailController!,
              labelText: 'Your Email',
              onChanged: (text) =>
                  ref.read(emailProvider.notifier).state = text,
            ),
            CustomTextForm(
              controller: passwordController!,
              labelText: 'Password',
              obscureText: true,
              onChanged: (text) =>
                  ref.read(passwordProvider.notifier).state = text,
            ),
            CustomTextForm(
              controller: confirmPasswordController!,
              labelText: 'Confirm Password',
              obscureText: true,
              onChanged: (text) =>
                  ref.read(confirmPasswordProvider.notifier).state = text,
            ),
            const SizedBox(height: 30),
            LoginButton(
              buttonLabel: 'Create an account',
              label: "",
              onButtonTap: () async {
                try {
                  await ref.read(userProvider.notifier).register(
                      emailController!.text,
                      passwordController!.text,
                      nameController!.text);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("User Successfully Registered")));
                } catch (err) {
                  log('Error: $err');
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(err.toString())));
                }
              },
              onTap: () {},
              forgetPassword: true,
              color: AppColors.primaryLightColor,
              validate: true,
              isLogin: false,
            ),
          ],
        ),
      ),
    );
  }
}
