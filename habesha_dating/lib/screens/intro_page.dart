import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/auth/form_validation_provider.dart';
import '../widgets/or_spacer.dart';
import '../widgets/auth_widgets/login_button.dart';
import '../widgets/auth_widgets/social_icons.dart';
import '../widgets/motto.dart';
import '../themes/app_colors.dart';

class IntroPage extends ConsumerWidget {
  const IntroPage({super.key});

  void invalidateForm(WidgetRef ref) {
    ref.invalidate(emailProvider);
    ref.invalidate(passwordProvider);
    ref.invalidate(userNameProvider);
    ref.invalidate(confirmPasswordProvider);

    ref.invalidate(loginEmailProvider);
    ref.invalidate(loginPasswordProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // invalidateForm(ref);
    return Scaffold(
      body: Stack(
        children: [
          // Black background container
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
          // Gradient overlay container
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  AppColors.gradientStartColor,
                  Colors.transparent,
                ],
                stops: [0.0, 0.5], // Adjust the stop points as needed
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // const Spacer(flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                        child: Image.asset('assets/images/logo.png',
                            width: 30, height: 30)),
                    const SizedBox(width: 8),
                    Text(
                      'Habesha Dating',
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
                const SizedBox(height: 36),
                const Motto(),
                const SizedBox(height: 60),
                const SocialIcons(),
                const SizedBox(height: 20),
                const OrSpacer(),
                const SizedBox(height: 20),
                LoginButton(
                  buttonLabel: 'Sign up with email',
                  label: 'Existing account? ',
                  onButtonTap: () => context.push("/signup"),
                  onTap: () => context.push("/login"),
                ),

                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
