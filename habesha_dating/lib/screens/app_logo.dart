import 'package:flutter/material.dart';

import '../widgets/logo.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Logo(),
    );
  }
}
