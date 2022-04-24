import 'package:tutorial/303/mobx_image_picker/view/mobx_image_upload_view.dart';

import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';

class NavigatorRoute {
  static const _paragfh = '/';
  final items = {
    _paragfh: (context) => const MobxImageUpload(),
    NavigateRoutes.home.withParaf: (context) => const NavigateHomeView(),
    NavigateRoutes.homeDetail.withParaf: (context) => const NavigateHomeDetailView(),
  };
}

enum NavigateRoutes { init, home, homeDetail }

extension NavigatorRoutNameExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
