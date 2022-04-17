// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  State<StatefullLifeCycleLearn> createState() => _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  String _message = '';
  late bool _isOdd;
  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();
    print('initState');
  }

  void _computeName() {
    if (widget.message.length.isOdd) {
      _message += ' Tek';
    } else {
      _message += ' Çift';
    }
  }

  // didChaqngeDependencies
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  // didUpdateWidget
  @override
  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(() {});
      print('didUpdateWidget');
    }
  }

  // dispose
  @override
  void dispose() {
    super.dispose();
    _message = '';
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
      body: Center(
        child: _isOdd
            ? TextButton(
                onPressed: () {},
                child: Text(_message),
              )
            : ElevatedButton(
                onPressed: () {
                  setState(() {
                    _message = 'Yeni';
                  });
                },
                child: Text(_message),
              ),
      ),
    );
  }
}
