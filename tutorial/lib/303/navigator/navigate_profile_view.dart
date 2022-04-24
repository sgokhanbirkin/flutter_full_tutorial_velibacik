import 'package:flutter/material.dart';

class NavigateProfileView extends StatelessWidget {
  const NavigateProfileView({Key? key}) : super(key: key);

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
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ),
    );
  }
}
