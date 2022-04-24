import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/product/constant/duration_items.dart';
import 'package:tutorial/product/constant/lottie_items.dart';
import 'package:tutorial/product/global/theme_notifier.dart';
import 'package:tutorial/product/navigator/navigator_routes.dart';

class LottieLearnView extends StatefulWidget {
  const LottieLearnView({Key? key}) : super(key: key);

  @override
  State<LottieLearnView> createState() => _LottieLearnViewState();
}

class _LottieLearnViewState extends State<LottieLearnView> with TickerProviderStateMixin {
  String title = 'Lottie';
  late AnimationController controller;
  bool isLight = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
  }

  void navigateToHome() {
    Future.delayed(DurationItems.durationNormal());
    Navigator.of(context).pushReplacementNamed(NavigateRoutes.home.withParaf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          InkWell(
            onTap: () {
              controller.animateTo(isLight ? 0.5 : 1.0);
              //controller.animateTo(0.5);
              isLight = !isLight;
              Future.microtask(() {
                context.read<ThemeNotifier>().changeTheme();
              });
            },
            child: Lottie.asset(
              LottieItems.themeChange.lottiePath,
              repeat: false,
              controller: controller,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const _LoadingWidget(),
          ElevatedButton(
            onPressed: navigateToHome,
            child: const Text('Navigate to Home'),
          ),
        ],
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var url = 'assets/lottie/lottie_loading.json';
    return Center(
      child: Lottie.asset(LottieItems.loading.lottiePath, repeat: false),
    );
  }
}
