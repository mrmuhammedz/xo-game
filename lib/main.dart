import 'package:flutter/material.dart';
import 'package:xo_game/ui/screens/game_screen.dart';
import 'package:xo_game/ui/screens/welcome_screen.dart';
import 'package:xo_game/ui/screens/win_screen.dart';

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
      routes: {
        WelcomeScreen.routeName : (context) => const WelcomeScreen(),
        GameScreen.routeName : (context) => const GameScreen(),
        WinScreen.routeName : (context) => const WinScreen(),
      },
      initialRoute: WelcomeScreen.routeName,
    );
  }
}
