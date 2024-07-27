// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habesha_dating/screens/settings/account_page.dart';

import '../screens/auth_screens/forget_password.dart';
import '../screens/home/chat_details.dart';
import '/screens/home/call_page.dart';
import '/screens/home/contacts_page.dart';
import '/screens/home/messages_page.dart';
import '/screens/home/settings_page.dart';
import '../providers/auth/auth_provider.dart';
import '/screens/auth_screens/login_page.dart';
import '/screens/auth_screens/signup_page.dart';
import '/screens/intro_page.dart';
import '/widgets/logo.dart';
import "/screens/home/home.dart";

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(authProvider);
    final loginFailedNotifier = ref.watch(authProvider.notifier);
    bool? userState = authState.value ?? false;

    return GoRouter(
      initialLocation: userState ? "/home" : "/intro",
      redirect: (context, state) {
        final isSigningUP = state.matchedLocation == "/signup";
        final isLoggingIn = state.matchedLocation == "/login";

        if (userState) {
          return "/home";
        } else if (loginFailedNotifier.loginFailed) {
          loginFailedNotifier.loginFailed = false;
          return "/login";
        } else if (isLoggingIn) {
          return null;
        } else if (loginFailedNotifier.signUpFailed) {
          loginFailedNotifier.loginFailed = false;
          return "/signup";
        } else if (isSigningUP) {
          return "/signup";
        } else {
          return "/intro";
        }
      },
      routes: <RouteBase>[
        GoRoute(
          path: "/",
          builder: (context, state) => const Logo(),
        ),
        GoRoute(
          path: "/intro",
          builder: (context, state) => const IntroPage(),
        ),
        GoRoute(
          path: "/signup",
          builder: (context, state) => const SignupPage(),
        ),
        GoRoute(path: "/login", builder: (context, state) => const LoginPage()),
        GoRoute(
          path: "/forget-password",
          builder: (context, state) => const ForgetPasswordPage(),
        ),
        GoRoute(
            path: "/home",
            builder: (context, state) => HomePage(),
            routes: [
              GoRoute(
                  path: "messages",
                  builder: (context, state) => const MessagesPage(),
                  routes: [
                    GoRoute(
                        path: "chat",
                        name: "/chat",
                        builder: (context, state) {
                          final isOnline = state.uri.queryParameters["isOline"];
                          final name = state.uri.queryParameters["name"];
                          final avatar = state.uri.queryParameters["avatar"];

                          return ChatDetailsPage(
                            isOnline: bool.tryParse(isOnline!)!,
                            name: name!,
                            avatar: avatar!,
                          );
                        })
                  ]),
              GoRoute(
                  path: "call", builder: (context, state) => const CallPage()),
              /* GoRoute(
                path: "contacts",
                builder: ( context,  state) 
                    {return ContactsPage(contacts: state.extra['contacts'],)}), */
              GoRoute(
                  path: "settings",
                  builder: (context, state) => const SettingsPage(),
                  routes: [
                    GoRoute(
                      path: "account",
                      builder: (context, state) => AccountPage(),
                    ),
                  ]),
            ])
      ],
    );
  },
);
