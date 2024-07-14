import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habesha_dating/screens/home/chat_details.dart';

import '/widgets/common/loader.dart';
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

final goRouterProvider = Provider<GoRouter>((ref) {
  final userState = ref.watch(userProvider);

  return GoRouter(
    // initialLocation: userState.value != null ? "/home" : "/intro",
    initialLocation: "/home",
    // redirect: (context, state) {
    //   final isLoggingIn = state.matchedLocation == "/home";

    // redirect: (context, state) {
    //   userState.when(
    //       data: (user) {
    //         log("userState in async: ${userState.value}");
    //         final isLoggedIn = state.matchedLocation == "/home";
    //         final isSigningUP = state.matchedLocation == "/signup";
    //         final isLoggingIn = state.matchedLocation == "/login";

    //         log("STATE: ${isLoggingIn}");

    //         if (user != null) {
    //           return "/home";
    //         } else if (isLoggingIn) {
    //           return "/login";
    //         } else if (isSigningUP) {
    //           return "/signup";
    //         }
    //       },
    //       error: (_, stackTrace) => null,
    //       loading: () => null);
    //   return null;
    // },
    routes: <RouteBase>[
      GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state) => const Logo(),
      ),
      GoRoute(
        path: "/intro",
        builder: (BuildContext context, GoRouterState state) =>
            const IntroPage(),
      ),
      GoRoute(
        path: "/signup",
        builder: (BuildContext context, GoRouterState state) {
          return const SignupPage();
        },
      ),
      GoRoute(
        path: "/login",
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
          path: "/home",
          builder: (BuildContext context, GoRouterState state) =>
              const HomePage(),
          routes: [
            GoRoute(
                path: "messages",
                builder: (BuildContext context, GoRouterState state) =>
                    const MessagesPage()),
            GoRoute(
                name: "/call",
                path: "call",
                builder: (BuildContext context, GoRouterState state) =>
                    const CallPage()),
            GoRoute(
                path: "contacts",
                builder: (BuildContext context, GoRouterState state) =>
                    const ContactsPage()),
            GoRoute(
                path: "settings",
                builder: (BuildContext context, GoRouterState state) =>
                    const SettingsPage()),
            /*  GoRoute(
                path: "chat",
                name: "/chat",
                builder: (BuildContext context, GoRouterState state) =>
                    const ChatDetailsPage()) */
          ])
    ],
  );
});
