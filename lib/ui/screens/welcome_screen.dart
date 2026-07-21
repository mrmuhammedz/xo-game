import 'package:flutter/material.dart';
import 'package:xo_game/ui/utils/app_assets.dart';
import 'package:xo_game/ui/utils/app_colors.dart';
import 'package:xo_game/ui/utils/app_style.dart';

class WelcomeScreen extends StatelessWidget {
  static final String routeName = "welcome screen";

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.cyan, AppColors.blue],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),
        image: DecorationImage(
          image: AssetImage(AppAssets.xoImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: scaffoldBuilder(),
      ),
    );
  }

  Widget scaffoldBuilder() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: .end,
              mainAxisAlignment: .center,
              children: [Text("Tic-Tac-Toe", style: AppStyle.white40black)],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: .end,
              children: [
                Text("Pick who goes first?", style: AppStyle.white24medium),
                SizedBox(height: 17),
                Row(
                  spacing: 15,
                  crossAxisAlignment: .end,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(32),
                          ),
                          padding: EdgeInsetsGeometry.all(39),
                        ),
                        child: Image.asset(AppAssets.icX),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(32),
                          ),
                          padding: EdgeInsetsGeometry.all(39),
                        ),
                        child: Image.asset(AppAssets.icO),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 26),
        ],
      ),
    );
  }
}
