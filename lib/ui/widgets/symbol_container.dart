import 'package:flutter/material.dart';
import 'package:xo_game/utils/app_colors.dart';

class SymbolContainer extends StatelessWidget {
  final String image;
  final double padding;
  const SymbolContainer({super.key, required this.image, this.padding = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(padding),
      decoration: BoxDecoration(
        borderRadius: .circular(32),
        color: AppColors.white
      ),
      child: Image.asset(image),
    );
  }
}
