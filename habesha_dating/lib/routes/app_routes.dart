import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/auth/auth_provider.dart';
import '/screens/auth_screens/login_page.dart';
import '/screens/auth_screens/signup_page.dart';
import '/screens/intro_page.dart';
import '/widgets/logo.dart';
import "/screens/home/home.dart";

final goRouterProvider = Provider<GoRouter>((ref) {
  final isLoggedIn = ref.watch(userProvider.notifier).isLoggedIn;

  log("ISLOGGED IN: $isLoggedIn");

  return GoRouter(
    initialLocation: isLoggedIn ? "/home" : "/",
    // redirect: (context, state) {
    //   final isLoggingIn = state.matchedLocation == '/home';
    //   log("isLoggingIn variable: $isLoggedIn");
    //   if (!isLoggingIn) return '/intro';
    //   if (isLoggingIn) return '/home';
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
          return SignupPage();
        },
      ),
      GoRoute(
        path: "/login",
        builder: (BuildContext context, GoRouterState state) {
          return LoginPage();
        },
      ),
      GoRoute(
        path: "/home",
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      )
    ],
  );
});
