import 'package:flutter/material.dart';

import 'screens/ex1_core_widgets.dart';
import 'screens/ex2_input_widgets.dart';
import 'screens/ex3_layout_basics.dart';
import 'screens/ex4_scaffold_theme.dart';
import 'screens/ex5_debug_fix.dart';

void main() {
  runApp(const Lab4App());
}

class Lab4App extends StatelessWidget {
  const Lab4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lab 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeMenu(),
    );
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Lab 4"),
      ),
      body: ListView(
        children: [
          _menuButton(
            context,
            "Exercise 1 - Core Widgets",
            const Ex1CoreWidgets(),
          ),
          _menuButton(
            context,
            "Exercise 2 - Input Widgets",
            const Ex2InputWidgets(),
          ),
          _menuButton(
            context,
            "Exercise 3 - Layout Basics",
            const Ex3LayoutBasics(),
          ),
          _menuButton(
            context,
            "Exercise 4 - Scaffold & Theme",
            const Ex4ScaffoldTheme(),
          ),
          _menuButton(
            context,
            "Exercise 5 - Debug Fixes",
            const Ex5DebugFix(),
          ),
        ],
      ),
    );
  }

  Widget _menuButton(
      BuildContext context,
      String title,
      Widget screen,
      ) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => screen,
            ),
          );
        },
        child: Text(title),
      ),
    );
  }
}