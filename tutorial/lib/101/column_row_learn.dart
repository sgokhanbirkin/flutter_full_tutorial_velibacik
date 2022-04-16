import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({Key? key}) : super(key: key);
  final String title1 = "Title1";
  final String title2 = "Title2";
  final String title3 = "Title3";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.red)),
                Expanded(child: Container(color: Colors.green)),
                Expanded(child: Container(color: Colors.blue)),
                Expanded(child: Container(color: Colors.pink)),
              ],
            ),
          ),
          //Expanded(flex: 2, child: FlutterLogo()),
          const Spacer(flex: 2),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(title1),
                Text(title2),
                Text(title3),
              ],
            ),
          ),
          SizedBox(
            height: ProjectContainerSizes.cardHeight,
            child: Column(
              children: [
                Expanded(child: Text(title1)),
                Expanded(child: Text(title1)),
                Expanded(child: Text(title1)),
                Expanded(child: Text(title1)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectContainerSizes {
  static const double cardHeight = 200;
}
