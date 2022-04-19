import 'package:flutter/material.dart';
import 'package:tutorial/202/package/launch_manager.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with TickerProviderStateMixin, LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onSecondary,
        onPressed: () {
          launchURL('https://pub.dev/packages/url_launcher');
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Test',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          //const LoadingBar(),
        ],
      ),
    );
  }
}
