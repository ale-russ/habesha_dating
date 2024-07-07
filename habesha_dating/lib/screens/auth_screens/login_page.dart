import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// import '/models/user_model.dart';
import '/providers/auth/auth_provider.dart';

import '../../providers/auth/form_validation_provider.dart';
import '/widgets/auth_widgets/auth_heading.dart';
import '../../providers/theme/theme_provider.dart';
import '/widgets/common/custom_appbar.dart';
import '/widgets/common/custom_text_field.dart';
import '/widgets/auth_widgets/login_button.dart';
import '../../themes/app_colors.dart';
import '/widgets/or_spacer.dart';
import '/widgets/auth_widgets/social_icons.dart';

// ignore: must_be_immutable
class LoginPage extends ConsumerWidget {
  LoginPage({
    super.key,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

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
              label: 'Login To Habesha Dating',
              isLogin: true,
            ),
            const SocialIcons(),
            const SizedBox(height: 30),
            const OrSpacer(),
            const SizedBox(height: 30),
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
            const SizedBox(height: 30),
            LoginButton(
              buttonLabel: 'Login',
              label: "Forgot password? ",
              onButtonTap: () async {
                /*  DatingUser? user; */
                try {
                  await ref
                      .read(userProvider.notifier)
                      .login(
                        emailController!.text,
                        passwordController!.text,
                      )
                      .then((_) => context.go("/home"));
                } catch (err) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(err.toString())));
                }
              },
              onTap: () {},
              forgetPassword: true,
              color: AppColors.primaryLightColor,
              validate: true,
              isLogin: true,
            ),
          ],
        ),
      ),
    );
  }
}
