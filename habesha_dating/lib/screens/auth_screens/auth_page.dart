// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '/providers/auth_provider.dart';
// import '/widgets/auth_widgets/auth_heading.dart';
// import '/theme_provider.dart';
// import '/widgets/common/custom_appbar.dart';
// import '/widgets/common/custom_text_field.dart';
// import '/widgets/auth_widgets/login_button.dart';
// import '/app_colors.dart';
// import '/widgets/or_spacer.dart';
// import '/widgets/auth_widgets/social_icons.dart';

// // ignore: must_be_immutable
// class AuthPage extends ConsumerWidget {
//   AuthPage({
//     super.key,
//     this.isLogin = true,
//   });

//   final bool isLogin;

//   TextEditingController? emailController = TextEditingController();
//   TextEditingController? passwordController = TextEditingController();
//   TextEditingController? confirmPasswordController = TextEditingController();
//   TextEditingController? nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final themeMode = ref.watch(themeProvider);

//     return Scaffold(
//       backgroundColor: themeMode == ThemeMode.dark
//           ? AppColors.darkAddIconBorderColor
//           : AppColors.secondaryLight,
//       appBar: const CustomAppBar(),
//       body: Form(
//         child: Column(
//           children: [
//             AuthHeading(isLogin: isLogin),
//             const SocialIcons(),
//             const SizedBox(height: 30),
//             const OrSpacer(),
//             const SizedBox(height: 30),
//             if (!isLogin)
//               CustomTextForm(
//                 controller: nameController!,
//                 labelText: 'Your Name',
//                 onChanged: (text) =>
//                     ref.read(userNameProvider.notifier).updateText(text),
//               ),
//             CustomTextForm(
//               controller: emailController!,
//               labelText: 'Your Email',
//               onChanged: (text) =>
//                   ref.read(emailProvider.notifier).updateText(text),
//             ),
//             CustomTextForm(
//               controller: passwordController!,
//               labelText: 'Password',
//               obscureText: true,
//               onChanged: (text) =>
//                   ref.read(passwordProvider.notifier).updateText(text),
//             ),
//             if (!isLogin)
//               CustomTextForm(
//                 controller: confirmPasswordController!,
//                 labelText: 'Confirm Password',
//                 obscureText: true,
//                 onChanged: (text) =>
//                     ref.read(confirmPasswordProvider.notifier).updateText(text),
//               ),
//             const SizedBox(height: 30),
//             LoginButton(
//               buttonLabel: isLogin ? "Log in" : 'Sign up with email',
//               label: isLogin ? 'Forgot password? ' : "",
//               onButtonTap: () {},
//               onTap: () {},
//               forgetPassword: true,
//               color: AppColors.primaryLightColor,
//               validate: true,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
