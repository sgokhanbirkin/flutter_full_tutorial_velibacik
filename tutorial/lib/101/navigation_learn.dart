import 'package:flutter/material.dart';
import 'package:tutorial/101/navigate_detail_learn.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);
  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManagerFirst {
  List<int> selectedItems = [];

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //ModalRoute.of(context).settings.arguments
  }

  void addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await navigateToWidgetNormal<bool>(context, const NavigateDetailLearnView());

          if (response == true) {
            // ignore: avoid_print
            print('Onaylandı');
          }
        },
        child: const Icon(Icons.navigation_rounded),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return TextButton(
            onPressed: () async {
              final response = await navigateToWidgetNormal<bool>(
                  context,
                  NavigateDetailLearnView(
                    isOkey: selectedItems.contains(index),
                  ));
              if (response is bool) {
                addSelected(index, response);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Placeholder(
                color: selectedItems.contains(index) ? Colors.green : Colors.red,
              ),
            ),
          );
        }),
      ),
    );
  }
}

mixin NavigatorManagerFirst {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        //fullscreenDialog: true, // ios
        settings: const RouteSettings(),
      ),
    );
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        settings: const RouteSettings(),
      ),
    );
  }
}
