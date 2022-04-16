import 'package:flutter/material.dart';

class PaddingLearnView extends StatelessWidget {
  const PaddingLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: ProjectPadding.pagePaddingVertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  height: 100,
                ),
              ),
              Padding(
                padding: ProjectPadding.pagePaddingRightOnly +
                    ProjectPadding.pagePaddingVertical,
                child: Container(
                  color: Colors.white,
                  height: 100,
                ),
              ),
              Container(
                color: Colors.white,
                height: 100,
                padding: ProjectPadding.pagePaddingVertical,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectPadding {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);
  static const pagePaddingHorizontal = EdgeInsets.symmetric(horizontal: 10);
  static const pagePaddingRightOnly = EdgeInsets.only(right: 20);
}
