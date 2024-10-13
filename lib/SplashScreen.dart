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
  double _opacity = 1.0;
  final List<String> _words = [
    'Hello',
    'Hola',
    'Bonjour',
    'Ciao',
    'Olá',
    '你好',
    'أرحبووو',
  ];

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Timer(const Duration(milliseconds: 500), () {
      Timer.periodic(const Duration(milliseconds: 150), (Timer timer) {
        if (_currentIndex < _words.length - 1) {
          setState(() {
            _currentIndex++;
          });
        } else {
          timer.cancel();
          setState(() {
            _opacity = 0.0;
          });
          Timer(const Duration(milliseconds: 200), () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 300), // Faster fade-out
          child: Text(
            _words[_currentIndex],
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
