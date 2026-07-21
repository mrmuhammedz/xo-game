import 'package:flutter/material.dart';
import 'package:xo_game/ui/utils/app_colors.dart';
import 'package:xo_game/ui/utils/app_style.dart';

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
      child: Center(
        child: Column(
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: EdgeInsetsGeometry.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadiusGeometry.circular(44),
              ),
              child: Text(
                "00:00",
                textAlign: .center,
                style: AppStyle.black32semiBold,
              ),
            ),
            SizedBox(height: 32),
            Text("Player 1’s Turn", style: AppStyle.white36bold),
            SizedBox(height: 24),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 13,
                  vertical: 22,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadiusGeometry.circular(44),
                ),
                // child: ,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
