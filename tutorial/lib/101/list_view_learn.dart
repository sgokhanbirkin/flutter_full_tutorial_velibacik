// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
            ),
          ),
          Container(
            color: Colors.red,
            height: 300,
          ),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.blue, width: 300),
                Container(color: Colors.green, width: 300),
                Container(color: Colors.red, width: 300),
                Container(color: Colors.yellow, width: 300),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          //x
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
            ),
          ),
          Container(
            color: Colors.red,
            height: 300,
          ),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.blue, width: 300),
                Container(color: Colors.green, width: 300),
                Container(color: Colors.red, width: 300),
                Container(color: Colors.yellow, width: 300),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          const ListDemo(),
        ],
      ),
    );
  }
}

class ListDemo extends StatefulWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  State<ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  @override
  void initState() {
    super.initState();
    print('Hellooo');
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    print('Bye');
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
