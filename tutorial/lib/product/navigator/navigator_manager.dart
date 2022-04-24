import 'package:flutter/cupertino.dart';

import 'navigator_routes.dart';

class NavigatorManager {
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorKey;

  Future<void> pushToPage(NavigateRoutes route, {Object? arguments}) async {
    await _navigatorKey.currentState?.pushNamed(route.withParaf, arguments: arguments);
  }
}
