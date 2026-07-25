import 'package:flutter/material.dart';
import 'package:xo_game/models/player_dm.dart';
import 'package:xo_game/ui/screens/welcome_screen.dart';
import 'package:xo_game/ui/widgets/symbol_container.dart';
import 'package:xo_game/ui/widgets/gradient_screen.dart';
import 'package:xo_game/utils/app_colors.dart';
import 'package:xo_game/utils/app_style.dart';

class WinScreen extends StatelessWidget {
  static const String routeName = "/win";

  const WinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlayerDm player = ModalRoute.of(context)?.settings.arguments as PlayerDm;
    return PopScope(
      canPop: false,
      child: GradientScreen(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              const Spacer(),
              Text(
                "The winner is ${player.playerName}",
                style: AppStyle.white36bold,
              ),
              Text("Wins: ${player.wins}", style: AppStyle.white32semiBold),
              const SizedBox(height: 30),
              SymbolContainer(image: player.symbol, padding: 30),
              const Spacer(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  button("Continue", () {
                    Navigator.pop(context);
                  }),
                  button("Play Again", () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      WelcomeScreen.routeName,
                      (route) => false,
                    );
                  }),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  FilledButton button(String text, Function onPress) => FilledButton(
    onPressed: () {
      onPress();
    },
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.blue,
      padding: const .symmetric(horizontal: 40, vertical: 16),
    ),
    child: Text(text, style: TextStyle(fontSize: 18)),
  );
}
