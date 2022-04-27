import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _url = 'assets/lottie/lottie_loading.json';
    return Center(
      child: Lottie.asset(_url),
    );
  }
}
