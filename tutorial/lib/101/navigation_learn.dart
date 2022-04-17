import 'package:flutter/material.dart';
import 'package:tutorial/101/image_learn.dart';
import 'package:tutorial/101/navigate_detail_learn.dart';
import 'package:tutorial/demos/color_demos_view.dart';
import 'package:tutorial/demos/my_collections_demo_view.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);
  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  List<int> selectedItems = [];

  @override
  void didChangeDependencies() {
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

          // if (response == true) {
          //   print('Onaylandı');
          // }
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

mixin NavigatorManager {
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
