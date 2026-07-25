import 'package:flutter/material.dart';
import 'package:xo_game/ui/screens/game_screen.dart';
import 'package:xo_game/ui/widgets/symbol_container.dart';
import 'package:xo_game/ui/widgets/gradient_screen.dart';
import 'package:xo_game/utils/app_assets.dart';
import 'package:xo_game/utils/app_style.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = "/welcome";

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScreen(
      image: AppAssets.xoImage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: .end,
                mainAxisAlignment: .center,
                children: [
                  const Text("Tic-Tac-Toe", style: AppStyle.white40black),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: .end,
                children: [
                  Text("Pick who goes first?", style: AppStyle.white24medium),
                  const SizedBox(height: 17),
                  Row(
                    spacing: 15,
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      buildPlayerButton(context, AppAssets.icX),
                      buildPlayerButton(context, AppAssets.icO),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildPlayerButton(BuildContext context, String imagePath) => InkWell(
    onTap: () {
      Navigator.pushNamed(
        context,
        GameScreen.routeName,
        arguments: (imagePath),
      );
    },
    child: SymbolContainer(image: imagePath),
  );
}
