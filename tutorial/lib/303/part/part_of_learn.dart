import 'package:flutter/material.dart';

part './part_appBar.dart';

class PartOfLearnView extends StatefulWidget {
  const PartOfLearnView({Key? key}) : super(key: key);

  @override
  State<PartOfLearnView> createState() => _PartOfLearnViewState();
}

class _PartOfLearnViewState extends State<PartOfLearnView> {
  final String title = 'Part of';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _PartOfAppBar(title: title),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
