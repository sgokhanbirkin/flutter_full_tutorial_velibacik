import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [CenterRedCircularProgress()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 100),
            CenterRedCircularProgress(),
            SizedBox(height: 100),
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              value: 0.6,
            ),
          ],
        ),
      ),
    );
  }
}

class CenterRedCircularProgress extends StatelessWidget {
  const CenterRedCircularProgress({
    Key? key,
  }) : super(key: key);
  final redColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
        strokeWidth: 10,
        value: 0.9,
        backgroundColor: Colors.white,
      ),
    );
  }
}
