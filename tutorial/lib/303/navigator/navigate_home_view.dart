import 'package:flutter/material.dart';
import 'package:tutorial/product/mixin/navigator_mixin.dart';
import 'package:tutorial/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({Key? key}) : super(key: key);

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> with NavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Navigate to Profile View'),
          onPressed: () {
            router.pushToPage(NavigateRoutes.homeDetail, arguments: '123');
            // NavigatorManager.instance.pushToPage(NavigateRoutes.homeDetail, arguments: '123');

            // Navigator.of(context).pushNamed(
            //   NavigateRoutes.homeDetail.withParaf,
            //   arguments: 'sgb',
            // );
          },
        ),
      ),
    );
  }
}
