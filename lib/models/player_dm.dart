import 'dart:ui';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class PlayerDm {
  int id;
  late String playerName = "Player $id";
  String symbol;
  int wins = 0;

  PlayerDm({required this.id, required this.symbol});

  Color get color => symbol == AppAssets.icO ? AppColors.green : AppColors.rose;
}
