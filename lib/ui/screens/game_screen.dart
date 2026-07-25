import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xo_game/models/player_dm.dart';
import 'package:xo_game/ui/widgets/xo_button.dart';
import 'package:xo_game/ui/widgets/gradient_screen.dart';
import 'package:xo_game/ui/screens/win_screen.dart';
import 'package:xo_game/utils/app_assets.dart';
import 'package:xo_game/utils/app_colors.dart';
import 'package:xo_game/utils/app_style.dart';

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
  bool playerOneStarts = true;
  late PlayerDm player1;
  late PlayerDm player2;
  int draw = 0;

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      player1 = PlayerDm(
        id: 1,
        symbol: ModalRoute.of(context)!.settings.arguments as String,
      );
      player2 = PlayerDm(
        id: 2,
        symbol: player1.symbol == AppAssets.icX ? AppAssets.icO : AppAssets.icX,
      );
      // playerOneSymbol = ModalRoute.of(context)!.settings.arguments as String;
      //
      // playerTwoSymbol = playerOneSymbol == AppAssets.icX
      //     ? AppAssets.icO
      //     : AppAssets.icX;

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
                const SizedBox(height: 15),
                buildTimer(),
                const SizedBox(height: 25),
                buildStates(),
                const SizedBox(height: 20),
                Text(
                  "${currentPlayer.playerName}’s Turn",
                  style: AppStyle.white36bold,
                ),
                const SizedBox(height: 10),
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

  Widget buildStates() {
    return Row(
      mainAxisAlignment: .spaceAround,
      children: [
        statesContainer(
          player: player1,
          isCurrentPlayer: currentPlayer == player1,
        ),
        statesContainer(),
        statesContainer(
          player: player2,
          isCurrentPlayer: currentPlayer == player2,
        ),
      ],
    );
  }

  Container statesContainer({PlayerDm? player, bool isCurrentPlayer = false}) {
    final isDraw = player == null;
    final backgroundColor = isDraw
        ? AppColors.white
        : isCurrentPlayer
        ? player.color
        : AppColors.white;

    final title = isDraw ? "Draw" : "Player: ${player.id}";
    final subtitle = isDraw ? "$draw" : "Wins: ${player.wins}";
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: .circular(10),
      ),
      padding: .symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 20)),
          Text(subtitle, style: TextStyle(fontSize: 16)),
        ],
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

  PlayerDm get currentPlayer =>
      (turnIndex.isEven == playerOneStarts) ? player1 : player2;

  void onPlayerClick(int index) async {
    if (boardCells[index].isNotEmpty) return;
    setState(() => boardCells[index] = currentPlayer.symbol);
    if (checkWinner()) {
      timer.cancel();
      setState(() => currentPlayer.wins++);
      await Navigator.pushNamed(
        context,
        WinScreen.routeName,
        arguments: currentPlayer,
      );
      startNewRound();
      return;
    }
    if (turnIndex == 8) {
      setState(() => draw++);

      startNewRound();
      return;
    }
    setState(() => turnIndex++);
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
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

  void startNewRound() {
    boardCells = List.filled(9, "");
    turnIndex = 0;
    playerOneStarts = !playerOneStarts;
    startTimer();
  }
}
