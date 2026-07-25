import 'package:flutter/material.dart';
import 'package:xo_game/utils/app_colors.dart';

abstract final class AppStyle {
  static const TextStyle white24medium = TextStyle(color: AppColors.white,fontSize: 24,fontWeight: FontWeight.w500);
  static const TextStyle white32semiBold = TextStyle(color: AppColors.white,fontSize: 32,fontWeight: FontWeight.w600);
  static const TextStyle black32semiBold = TextStyle(color: AppColors.black,fontSize: 32,fontWeight: FontWeight.w600);
  static const TextStyle white36bold = TextStyle(color: AppColors.white,fontSize: 36,fontWeight: FontWeight.w700);
  static const TextStyle white40black = TextStyle(color: AppColors.white,fontSize: 40,fontWeight: FontWeight.w900);
}