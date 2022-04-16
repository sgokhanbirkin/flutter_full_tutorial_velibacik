import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({Key? key}) : super(key: key);
  final String _buttonText = 'Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomFootButton(
                  buttonText: _buttonText,
                  onPressedFunction: () {},
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomFootButton(
              buttonText: _buttonText,
              onPressedFunction: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets lowPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normalPadding = const EdgeInsets.all(16.0);
}

class CustomFootButton extends StatelessWidget with _ColorsUtility {
  CustomFootButton(
      {Key? key, required this.buttonText, required this.onPressedFunction})
      : super(key: key);
  final String buttonText;
  //final VoidCallback onPressed;
  final void Function() onPressedFunction;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: redColor,
        shape: const StadiumBorder(),
      ),
      child: Padding(
        padding: _PaddingUtility().lowPadding,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
        ),
      ),
      onPressed: onPressedFunction,
    );
  }
}
