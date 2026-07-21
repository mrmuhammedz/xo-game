import 'package:flutter/material.dart';
import 'package:xo_game/ui/utils/app_colors.dart';

class GameScreen extends StatelessWidget {
  static final String routeName = "game screen";

  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.cyan, AppColors.blue],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: scaffoldBodyBuilder(),
      ),
    );
  }

  Widget scaffoldBodyBuilder() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
    );
  }
}
