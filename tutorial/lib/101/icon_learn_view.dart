import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({Key? key}) : super(key: key);
  final String _title = 'Icon Learn';
  final IconSizes iconSizes = IconSizes();
  final IconColors iconColors = IconColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          children: [
            const Icon(
              Icons.add,
              color: Colors.red,
              size: 50,
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
                color: iconColors.froly,
                size: iconSizes.iconSmall,
                semanticLabel: 'Add',
              ),
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
                color: iconColors.froly,
                size: IconSizes.iconSmall2x,
                semanticLabel: 'Add',
              ),
            ),
            const SizedBox(height: 40),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
                color: Theme.of(context).backgroundColor,
                size: iconSizes.iconSmall,
                semanticLabel: 'Add',
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class IconSizes {
  final double iconSmall = 40;
  static const double iconSmall2x = 80;
}

class IconColors {
  final Color froly = const Color(0xffED617A);
}
