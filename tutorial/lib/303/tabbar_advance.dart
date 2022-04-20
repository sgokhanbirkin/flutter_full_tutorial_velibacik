import 'package:flutter/material.dart';
import 'package:tutorial/101/icon_learn.dart';
import 'package:tutorial/101/image_learn.dart';
import 'package:tutorial/303/feed_view.dart';

class TabAdvanceLearn extends StatefulWidget {
  const TabAdvanceLearn({Key? key}) : super(key: key);

  @override
  State<TabAdvanceLearn> createState() => _TabAdvanceLearnState();
}

class _TabAdvanceLearnState extends State<TabAdvanceLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double notchMargin2 = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _MyTabViews.values.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        body: _tabBarView(),
        bottomNavigationBar: BottomAppBar(
          notchMargin: notchMargin2,
          shape: const CircularNotchedRectangle(),
          child: _myTabBarView(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(1);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  TabBar _myTabBarView() {
    return TabBar(
      // indicatorColor: Colors.white,
      // //isScrollable: true,
      // labelColor: Colors.green,
      // unselectedLabelColor: Colors.red,
      padding: EdgeInsets.zero,
      onTap: (int index) {},
      controller: _tabController,
      tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList(),
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      //physics: NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        const FeedView(),
        IconLearnView(),
        IconLearnView(),
        IconLearnView(),
      ],
    );
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
