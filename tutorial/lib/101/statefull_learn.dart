import 'package:flutter/material.dart';
import 'package:tutorial/product/counter_hello_button.dart';
import 'package:tutorial/product/language/language_items.dart';

class StateFullView extends StatefulWidget {
  const StateFullView({Key? key}) : super(key: key);

  @override
  State<StateFullView> createState() => _StateFullViewState();
}

class _StateFullViewState extends State<StateFullView> {
  int _counter = 0;
  int _counterCustom = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void deincrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _updateCounter(bool isIncrement) {
    setState(() {
      if (isIncrement) {
        _counter++;
      } else {
        _counter--;
      }
    });
  }

  final String data = 'Merhaba';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.welcomeTitle),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              _counter.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
            const Placeholder(),
            const CounterHelloButton(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(),
          _deincrementButton(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  FloatingActionButton _incrementButton() {
    print('Burda');
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
      },
      child: const Icon(Icons.add),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: FloatingActionButton(
        onPressed: () {
          _updateCounter(false);
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
