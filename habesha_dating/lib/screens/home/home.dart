import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.green,
              // shape: BoxShape.circle,
              border: Border.all(color: Colors.red)),
          child: IconButton(
            icon: const Icon(
              Icons.search_rounded,
            ),
            onPressed: () {},
          ),
        ),
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ClipOval(
              child: Image.network(
                  width: 40,
                  height: 40,
                  "https://pics.craiyon.com/2023-07-15/dc2ec5a571974417a5551420a4fb0587.webp"),
            ),
          ),
        ],
      ),
    );
  }
}
