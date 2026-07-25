import 'package:flutter/material.dart';

class XoButton extends StatelessWidget {
  final String symbol;
  final void Function(int index) onClick;
  final int index;

  const XoButton({super.key, required this.symbol, required this.onClick, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onClick(index);
        },
        child: symbol.isEmpty
              ? SizedBox(height: double.infinity,)
              : Image.asset(symbol),
        ),
    );
  }
}
