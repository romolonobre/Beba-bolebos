import 'package:flutter/material.dart';

import 'splash_screen.dart';

void main() {
  runApp(const BebaBolebosApp());
}

class BebaBolebosApp extends StatelessWidget {
  const BebaBolebosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Beba Bolebos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
  }
}
