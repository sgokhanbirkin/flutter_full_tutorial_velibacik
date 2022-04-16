import 'package:flutter/material.dart';
import 'package:tutorial/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const RandomImage(height: 100),
                  contentPadding: EdgeInsets.zero,
                  subtitle: const Text('This is my card'),
                  minVerticalPadding: 0,
                  dense: true,
                  leading: Container(
                    alignment: Alignment.topCenter,
                    height: 100,
                    width: 20,
                    child: const Icon(Icons.money),
                  ),
                  trailing: Container(
                    // color: Colors.red,
                    alignment: Alignment.bottomCenter,
                    width: 20,
                    child: const Icon(Icons.chevron_right),
                  ),
                  onTap: () {},
                  style: ListTileStyle.drawer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
