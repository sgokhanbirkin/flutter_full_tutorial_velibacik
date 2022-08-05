import 'package:flutter/material.dart';

class NavigateDetailLearnView extends StatefulWidget {
  const NavigateDetailLearnView({Key? key, this.isOkey = false}) : super(key: key);
  final bool isOkey;

  @override
  State<NavigateDetailLearnView> createState() => _NavigateDetailLearnViewState();
}

class _NavigateDetailLearnViewState extends State<NavigateDetailLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop(!widget.isOkey);
          },
          label: widget.isOkey ? const Text('Red') : const Text('Onayla'),
          icon: Icon(
            Icons.check,
            color: widget.isOkey ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }
}
