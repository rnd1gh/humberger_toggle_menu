import 'dart:math';

import 'package:flutter/material.dart';
import 'package:humberger_toggle_menu/humberger_toggle_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Humberger Toggle Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xFF051f2e),
        child: Center(
          child: HumbergerToggleMenu(
            height: 150,
            onPress: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            isSelected: isSelected,
          ),
        ),
      ),
    );
  }
}

// Add animation rotate
