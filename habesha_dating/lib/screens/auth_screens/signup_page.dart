import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../providers/loading_provider.dart';
import '../../providers/lock_icon_provider.dart';
import '../../widgets/common/loader.dart';
import '/utils/image_picker.dart';
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

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({
    super.key,
  });
  @override
  SignupPageState createState() => SignupPageState();
}

// ignore: must_be_immutable
class SignupPageState extends ConsumerState<SignupPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  File? imgFile;

  Uint8List? _imageBytes;
  // bool isLoading = false;

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();
  TextEditingController? nameController = TextEditingController();

  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    confirmPasswordController!.dispose();
    nameController!.dispose();
    super.dispose();
  }

  void _pickImage(WidgetRef ref) async {
    if (kIsWeb) {
      log("TRUE");
      final pickedImage = await pickedImageWeb();

      if (pickedImage != null) {
        _imageBytes = pickedImage;
        setState(() {});
      }
    } else {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imgFile = File(pickedFile.path);
        log("GalleryFile: $imgFile");
        _imageBytes = await imgFile!.readAsBytes();
      } else {
        log("OOps something went wrong");
      }
      setState(() {});
    }
    ref.read(profileImageProvider.notifier).state = _imageBytes;
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final iconLock = ref.watch(iconLockProvider);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: themeMode == ThemeMode.dark
          ? AppColors.darkAddIconBorderColor
          : AppColors.secondaryLight,
      appBar: const CustomAppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHeading(
                label: 'Sign up with Email',
                isLogin: false,
              ),
              const SocialIcons(),
              const SizedBox(height: kIsWeb ? 30 : 8),
              const OrSpacer(),
              const SizedBox(height: kIsWeb ? 30 : 8),
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
                obscureText: iconLock ? true : false,
                isPassword: true,
                onIconTap: () =>
                    ref.read(iconLockProvider.notifier).state = !iconLock,
                onChanged: (text) =>
                    ref.read(passwordProvider.notifier).state = text,
              ),
              CustomTextForm(
                controller: confirmPasswordController!,
                labelText: 'Confirm Password',
                obscureText: iconLock ? true : false,
                isPassword: true,
                onIconTap: () =>
                    ref.read(iconLockProvider.notifier).state = !iconLock,
                onChanged: (text) =>
                    ref.read(confirmPasswordProvider.notifier).state = text,
              ),
              const SizedBox(height: kIsWeb ? 30 : 8),
              InkWell(
                onTap: () => _pickImage(ref),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: themeMode == ThemeMode.dark
                            ? AppColors.passwordBorderDarkColor
                            : AppColors.passwordBorderLightColor),
                  ),
                  child: Center(
                    child: _imageBytes != null
                        ? ClipOval(
                            child: Image.memory(_imageBytes!,
                                height: 60, width: 60),
                          )
                        : Text(
                            "Upload Profile Pic",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    fontSize: 14,
                                    color: themeMode == ThemeMode.light
                                        ? AppColors.secondaryDark
                                        : AppColors.secondaryLight),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: kIsWeb ? 30 : 8),
              LoginButton(
                buttonLabel: 'Create an account',
                label: "Already registered? ",
                onButtonTap: () async {
                  final ctx = ScaffoldMessenger.of(context);
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }

                  ref.read(loadingProvider.notifier).state = true;
                  try {
                    await ref
                        .read(authProvider.notifier)
                        .register(
                            emailController!.text,
                            passwordController!.text,
                            nameController!.text,
                            _imageBytes)
                        .then((_) => context.push("/login"));
                    ctx.showSnackBar(const SnackBar(
                      backgroundColor: AppColors.primaryDarkColor,
                      content: Text(
                          "User Successfully Registered. Please Login with your credentials"),
                    ));
                  } catch (err) {
                    ctx.showSnackBar(SnackBar(
                      backgroundColor: AppColors.darkErrorColor,
                      content: Text(err.toString()),
                    ));
                  } finally {
                    ref.invalidate(userNameProvider);
                    ref.invalidate(emailProvider);
                    ref.invalidate(passwordProvider);
                    ref.invalidate(confirmPasswordProvider);
                    ref.invalidate(profileImageProvider);
                    ref.read(loadingProvider.notifier).state = false;
                  }
                },
                onTap: () => context.go("/login"),
                color: AppColors.primaryLightColor,
                validate: true,
                isLogin: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
