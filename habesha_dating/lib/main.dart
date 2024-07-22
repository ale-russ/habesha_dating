import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habesha_dating/routes/app_routes.dart';
import 'package:url_strategy/url_strategy.dart';

import 'providers/theme/theme_provider.dart';

import 'themes/app_theme.dart';
import 'utils/db_access.dart';

// import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialSetup();
  runApp(const ProviderScope(child: MyApp()));
}

Future initialSetup() async {
  // initialize hive and open DB
  await DbAccess.initHive();

  if (kIsWeb) setPathUrlStrategy();
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      title: 'Flutter Demo',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.dark,
    );
  }
}
