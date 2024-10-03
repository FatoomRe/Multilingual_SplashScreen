// ignore_for_file: library_private_types_in_public_api, file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splash_screen/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  final List<String> _words = [
    'Hello',
    'Bonjour',
    'Ciao',
    'Olá',
    '哈罗',
    'أرحبووو',
  ];

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Timer.periodic(const Duration(milliseconds: 400), (Timer timer) {
      if (_currentIndex < _words.length - 1) {
        setState(() {
          _currentIndex++;
        });
      } else {
        timer.cancel();
        Timer(const Duration(milliseconds: 500), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          _words[_currentIndex],
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}