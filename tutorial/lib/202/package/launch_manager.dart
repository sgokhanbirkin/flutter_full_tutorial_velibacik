import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      print('TEST');
      await launch(url);
    }
    try {
      await launch(url);
    } catch (e) {
      print(e);
    }
  }
}
