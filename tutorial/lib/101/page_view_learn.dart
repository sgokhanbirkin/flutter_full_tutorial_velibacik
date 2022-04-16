import 'package:flutter/material.dart';
import 'package:tutorial/101/icon_learn.dart';
import 'package:tutorial/101/image_learn.dart';
import 'package:tutorial/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        controller: _pageController,
        padEnds: false,
        onPageChanged: _updatePageIndex,
        children: [
          const ImageLearn(),
          IconLearnView(),
          const StackLearn(),
        ],
      ),
      floatingActionButton: Row(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              '${_currentPageIndex + 1}',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Spacer(),
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(
                duration: _DurationUtility._duration,
                curve: Curves.slowMiddle,
              );
            },
            child: const Icon(
              Icons.chevron_left,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(
                duration: _DurationUtility._duration,
                curve: Curves.slowMiddle,
              );
            },
            child: const Icon(
              Icons.chevron_right,
            ),
          ),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const Duration _duration = Duration(seconds: 1);
}
