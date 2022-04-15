import 'package:flutter/material.dart';
import 'package:tutorial/101/container_sized_box_learn_view.dart';
import 'package:tutorial/101/text_learn_view.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold Samples'),
      ),
      body: Center(),
      bottomNavigationBar: Container(
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(
          elevation: 5,
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
        ),
      ),
      drawer: const Drawer(),
      backgroundColor: Colors.white30,
      // bottomSheet: BottomSheet(
      //   onClosing: () {},
      //   builder: (context) {
      //     return Container(
      //       height: 100,
      //       color: Colors.red,
      //       child: Center(
      //         child: Text('BottomSheet'),
      //       ),
      //     );
      //   },
      //   enableDrag: true,
      //   animationController: AnimationController(
      //     duration: const Duration(milliseconds: 300),
      //     vsync: context,
      //   ),
      // ),

      //floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              height: 100,
              color: Colors.red,
              child: Center(
                child: Text('BottomSheet'),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
    );
  }
}
