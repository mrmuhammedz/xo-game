import 'package:flutter/material.dart';
import 'package:xo_game/ui/screens/welcome_screen.dart';
import 'package:xo_game/ui/screens/widgets/symbol_container.dart';
import 'package:xo_game/ui/screens/widgets/gradient_screen.dart';
import 'package:xo_game/ui/utils/app_colors.dart';
import 'package:xo_game/ui/utils/app_style.dart';

class WinScreen extends StatelessWidget {
  static const String routeName = "/win";

  const WinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScreen(
      child: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          const Spacer(),

          Text(
            "The winner is Player ${args["player"]}",
            style: AppStyle.white36bold,
          ),

          const SizedBox(height: 40),

          SymbolContainer(image: args["symbol"]!,padding: 39,),

          const Spacer(),

          const Text(
            "Want to play again?",
            style: AppStyle.grey22
          ),

          const SizedBox(height: 20),

          FilledButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, WelcomeScreen.routeName, (route) => false);
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.blue,
              padding: const .symmetric(
                horizontal: 40,
                vertical: 16,
              ),
            ),
            child: const Text(
              "Play Again",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
