import 'package:flutter/material.dart';
import 'package:tutorial/core/random_image.dart';

class StateDemoView extends StatelessWidget {
  const StateDemoView({Key? key}) : super(key: key);
  final double _cardHeight = 50;
  final double width2 = 200;
  final double bottom2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: const RandomImage(),
                  bottom: _cardHeight / 2,
                ),
                Positioned(
                  height: _cardHeight,
                  bottom: bottom2,
                  width: width2,
                  child: _cardCustom(),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 6,
          )
        ],
      ),
    );
  }

  Card _cardCustom() {
    return const Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}
