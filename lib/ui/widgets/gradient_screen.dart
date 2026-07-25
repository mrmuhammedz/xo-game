import 'package:flutter/material.dart';
import 'package:xo_game/utils/app_colors.dart';

class GradientScreen extends StatelessWidget {
  final Widget child;
  final String? image;

  const GradientScreen({super.key, required this.child, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.cyan, AppColors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        image: image == null
            ? null
            : DecorationImage(image: AssetImage(image!), fit: BoxFit.fill),
      ),
      child: Scaffold(backgroundColor: Colors.transparent, body: child),
    );
  }
}
