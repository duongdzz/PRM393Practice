import 'package:flutter/material.dart';

class Ex4ScaffoldTheme extends StatefulWidget {
  const Ex4ScaffoldTheme({super.key});

  @override
  State<Ex4ScaffoldTheme> createState() =>
      _Ex4ScaffoldThemeState();
}

class _Ex4ScaffoldThemeState
    extends State<Ex4ScaffoldTheme> {

  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Exercise 4"),
        ),

        body: Center(
          child: SwitchListTile(
            title: const Text("Dark Mode"),
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
        ),

        floatingActionButton:
        FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(
              const SnackBar(
                content: Text("FAB Pressed"),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}