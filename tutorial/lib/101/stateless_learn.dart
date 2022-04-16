// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = 'Data';
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TitleTextWidget(title: title),
            _emptyBox(),
            TitleTextWidget(title: title),
            _emptyBox(),
            TitleTextWidget(title: title),
            _emptyBox(),
            const _CustomContainer(),
            _emptyBox(),
          ],
        ),
      ),
    );
  }

  SizedBox _emptyBox() => const SizedBox(height: 20);
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
      ),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  TitleTextWidget({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
