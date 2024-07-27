import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habesha_dating/screens/settings/account_page.dart';

import '../screens/home/chat_details.dart';
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

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(authProvider);
    final loginFailedNotifier = ref.watch(authProvider.notifier);
    bool? userState = authState.value ?? false;

    return GoRouter(
      initialLocation: userState ? "/home" : "/intro",
      redirect: (context, state) {
        log('isLoggingIn, ${state.uri}');
        final isSigningUP = state.matchedLocation == "/signup";
        final isLoggingIn = state.matchedLocation == "/login";

        log('isLoggingIn, $isLoggingIn');
        log("loginFailure: ${loginFailedNotifier.loginFailed}");

        if (userState) {
          return "/home";
        } else if (loginFailedNotifier.loginFailed) {
          loginFailedNotifier.loginFailed = false;
          return "/login";
        } else if (isLoggingIn) {
          return null;
        } else if (isSigningUP) {
          return "/signup";
        } else {
          return "/intro";
        }
      },
      routes: <RouteBase>[
        GoRoute(
          path: "/",
          builder: (BuildContext context, GoRouterState state) => const Logo(),
        ),
        GoRoute(
          path: "/loader",
          builder: (context, state) => const Loader(),
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
            builder: (BuildContext context, GoRouterState state) => HomePage(),
            routes: [
              GoRoute(
                  path: "messages",
                  builder: (BuildContext context, GoRouterState state) =>
                      const MessagesPage(),
                  routes: [
                    GoRoute(
                        path: "chat",
                        name: "/chat",
                        builder: (BuildContext context, GoRouterState state) {
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
                  path: "call",
                  builder: (BuildContext context, GoRouterState state) =>
                      const CallPage()),
              /* GoRoute(
                path: "contacts",
                builder: (BuildContext context, GoRouterState state) 
                    {return ContactsPage(contacts: state.extra['contacts'],)}), */
              GoRoute(
                  path: "settings",
                  builder: (BuildContext context, GoRouterState state) =>
                      const SettingsPage(),
                  routes: [
                    GoRoute(
                      path: "account",
                      builder: (BuildContext context, GoRouterState state) =>
                          AccountPage(),
                    ),
                  ]),
            ])
      ],
    );
  },
);
