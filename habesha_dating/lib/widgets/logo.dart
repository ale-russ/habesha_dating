import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => context.go("/intro"),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 180,
              width: 180,
            ),
            const Text(
              'Habesha Dating',
              style: TextStyle(fontSize: 28),
            )
          ],
        )),
      ),
    );
  }
}
