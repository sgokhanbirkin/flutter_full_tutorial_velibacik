import 'package:flutter/material.dart';
import '../../303/mobx_image_picker/view/mobx_image_upload_view.dart';
import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';
import '../../main.dart';
import 'navigator_routes.dart';

mixin NavigatorCustom<T extends MyApp> on Widget {
  static const _paragfh = '/';

  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      return _navigateToNormal(const MobxImageUpload());
    }
    // if (routeSettings.name == _paragfh) {
    //   return _navigateToNormal(const LottieLearnView());
    // }
    final _routes = routeSettings.name == _paragfh
        ? NavigateRoutes.init
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));

    switch (_routes) {
      case NavigateRoutes.init:
        return _navigateToNormal(const MobxImageUpload());
      case NavigateRoutes.home:
        return _navigateToNormal(const NavigateHomeView());
      case NavigateRoutes.homeDetail:
        final _id = routeSettings.arguments;
        return _navigateToNormal(
          NavigateHomeDetailView(
            id: _id is String ? _id : null,
          ),
          isFullScreenDialog: true,
        );
    }

    // if (routeSettings.name == '/homeDetail') {
    //   final _id = routeSettings.arguments;
    //   return _navigateToNormal(NavigateHomeDetailView(
    //     id: _id is String ? _id : null,
    //   ));
    // }
    // return null;
  }
}

Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
  return MaterialPageRoute(
    fullscreenDialog: isFullScreenDialog ?? false,
    builder: (context) => child,
  );
}
