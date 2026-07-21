import 'package:flutter/material.dart';
import 'package:xo_game/ui/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XO Game',
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName : (context) => WelcomeScreen(),
      },
    );
  }
}
