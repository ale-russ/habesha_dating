import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '/providers/loading_provider.dart';
import '../../widgets/common/loader.dart';
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

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final isLoading = ref.watch(loadingProvider);

    return isLoading
        ? const Loader()
        : Scaffold(
            resizeToAvoidBottomInset: false,
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
                  const SizedBox(height: kIsWeb ? 30 : 16),
                  const OrSpacer(),
                  const SizedBox(height: kIsWeb ? 30 : 16),
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
                  const SizedBox(height: kIsWeb ? 30 : 16),
                  LoginButton(
                    buttonLabel: 'Login',
                    label: "Forgot password? ",
                    onButtonTap: () async {
                      final ctx = ScaffoldMessenger.of(context);
                      ref.read(loadingProvider.notifier).state = true;
                      try {
                        await ref.read(authController.notifier).login(
                              emailController!.text,
                              passwordController!.text,
                            );
                        if (mounted) {
                          context.pushReplacement("/home");
                        }
                      } catch (err) {
                        ctx.showSnackBar(SnackBar(
                          backgroundColor: AppColors.darkErrorColor,
                          content: Text(
                            err.toString(),
                          ),
                        ));
                      } finally {
                        ref.read(loadingProvider.notifier).state = false;
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
