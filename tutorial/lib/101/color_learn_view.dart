import 'package:flutter/material.dart';

class ColorLearnView extends StatelessWidget {
  const ColorLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: ColorsItems.porchase,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Hello',
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: Theme.of(context).errorColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorsItems {
  static final Color porchase = const Color(0xffEDBF61);
  static final Color sulu = Color.fromARGB(255, 246, 246, 246);
}
