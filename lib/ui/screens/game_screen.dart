import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xo_game/ui/screens/widgets/xo_button.dart';
import 'package:xo_game/ui/screens/widgets/gradient_screen.dart';
import 'package:xo_game/ui/screens/win_screen.dart';
import 'package:xo_game/ui/utils/app_assets.dart';
import 'package:xo_game/ui/utils/app_colors.dart';
import 'package:xo_game/ui/utils/app_style.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = "/game";

  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int turnIndex = 0;
  List<String> boardCells = ["", "", "", "", "", "", "", "", ""];
  late Timer timer;
  late String playerOneSymbol;
  late String playerTwoSymbol;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) => setState(() {}));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      playerOneSymbol = ModalRoute.of(context)!.settings.arguments as String;

      playerTwoSymbol = playerOneSymbol == AppAssets.icX
          ? AppAssets.icO
          : AppAssets.icX;

      _isInitialized = true;
    }
    return GradientScreen(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: .center,
              children: [
                const SizedBox(height: 25),
                buildTimer(),
                const SizedBox(height: 32),
                Text(
                  "Player ${turnIndex.isEven ? "1" : "2"}’s Turn",
                  style: AppStyle.white36bold,
                ),
                const SizedBox(height: 24),
                buildGameGrid(),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTimer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusGeometry.circular(44),
      ),
      child: Text(
        formatIntToTime(timer.tick),
        textAlign: .center,
        style: AppStyle.black32semiBold,
      ),
    );
  }

  Widget buildGameGrid() {
    return Expanded(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadiusGeometry.circular(44),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      XoButton(
                        symbol: boardCells[0],
                        onClick: onPlayerClick,
                        index: 0,
                      ),
                      XoButton(
                        symbol: boardCells[1],
                        onClick: onPlayerClick,
                        index: 1,
                      ),
                      XoButton(
                        symbol: boardCells[2],
                        onClick: onPlayerClick,
                        index: 2,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      XoButton(
                        symbol: boardCells[3],
                        onClick: onPlayerClick,
                        index: 3,
                      ),
                      XoButton(
                        symbol: boardCells[4],
                        onClick: onPlayerClick,
                        index: 4,
                      ),
                      XoButton(
                        symbol: boardCells[5],
                        onClick: onPlayerClick,
                        index: 5,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      XoButton(
                        symbol: boardCells[6],
                        onClick: onPlayerClick,
                        index: 6,
                      ),
                      XoButton(
                        symbol: boardCells[7],
                        onClick: onPlayerClick,
                        index: 7,
                      ),
                      XoButton(
                        symbol: boardCells[8],
                        onClick: onPlayerClick,
                        index: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.4),
            child: Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                VerticalDivider(thickness: 2, color: AppColors.black),
                VerticalDivider(thickness: 2, color: AppColors.black),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              mainAxisAlignment: .spaceEvenly,
              children: [
                Divider(thickness: 2, color: AppColors.black),
                Divider(thickness: 2, color: AppColors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onPlayerClick(int index) {
    setState(() {
      if(checkWinner()) return;
      if (boardCells[index].isNotEmpty) return;
      boardCells[index] = turnIndex.isEven ? playerOneSymbol : playerTwoSymbol;
      if (checkWinner()) {
        timer.cancel();
        Navigator.pushNamed(
          context,
          WinScreen.routeName,
          arguments: {
            "player": turnIndex.isEven ? "1" : "2",
            "symbol": turnIndex.isEven ? playerOneSymbol : playerTwoSymbol,
          },
        );
        return;
      }
      if (turnIndex == 8) {
        clearBoard();
        return;
      }
      turnIndex++;
    });
  }

  String formatIntToTime(int time) {
    int minutes = (time ~/ 60);
    int seconds = (time % 60);
    return "${minutes < 10 ? "0$minutes" : minutes}:${seconds < 10 ? "0$seconds" : seconds}";
  }

  bool checkWinner() {
    const wins = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var win in wins) {
      if (boardCells[win[0]].isNotEmpty &&
          boardCells[win[0]] == boardCells[win[1]] &&
          boardCells[win[0]] == boardCells[win[2]]) {
        return true;
      }
    }
    return false;
  }

  void clearBoard() {
    boardCells = List.filled(9, "");
    turnIndex = 0;
    timer.cancel();
  }
}
