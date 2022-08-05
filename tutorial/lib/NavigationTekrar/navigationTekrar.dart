import 'package:flutter/material.dart';

class NavigationTekrar extends StatefulWidget {
  const NavigationTekrar({Key? key}) : super(key: key);

  @override
  State<NavigationTekrar> createState() => _NavigationTekrarState();
}

class _NavigationTekrarState extends State<NavigationTekrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Tekrar'),
      ),
      body: Center(
        child: Container(
          child: const Text('NavigationTekrar'),
        ),
      ),
    );
  }
}
