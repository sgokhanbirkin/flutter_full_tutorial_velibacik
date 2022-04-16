import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({Key? key}) : super(key: key);
  final String _title = "Welcome Learn";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left),
        leadingWidth: 23,
        automaticallyImplyLeading: false,
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),
        toolbarTextStyle: Theme.of(context).textTheme.headline6?.copyWith(
              color: Colors.white,
            ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          // Text(_title),
          //const Center(child: CircularProgressIndicator())
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 100,
              color: Colors.white,
              child: Text(
                _title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          )
        ],
      ),
    );
  }
}
