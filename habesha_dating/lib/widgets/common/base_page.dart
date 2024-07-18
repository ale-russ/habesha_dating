import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasePage extends ConsumerWidget {
  final String title;
  final Widget body;
  final AppBar appBar;

  const BasePage(
      {super.key,
      required this.title,
      required this.body,
      required this.appBar});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
