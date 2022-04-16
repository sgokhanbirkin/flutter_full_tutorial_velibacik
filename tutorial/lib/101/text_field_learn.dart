import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              maxLength: 20,
              textInputAction: TextInputAction.next,
              buildCounter: (
                BuildContext context, {
                int? currentLength,
                int? maxLength,
                bool? isFocused,
              }) {
                // return Text('$currentLength/$maxLength');
                return Container(
                  key: key,
                  //duration: const Duration(seconds: 1),
                  //color: Colors.green[100 * ((currentLength ?? 0) ~/ 2)],
                  height: 10,
                  width: 10.0 * (currentLength ?? 0),
                  color: Colors.green,
                );
              },
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              inputFormatters: [TextProjectInputFormmatter()._formmater],
              focusNode: focusNodeTextFieldTwo,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                labelText: 'Enter your mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // fillColor: Colors.white,
                // filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              maxLength: 20,
              textInputAction: TextInputAction.next,
              buildCounter: (
                BuildContext context, {
                int? currentLength,
                int? maxLength,
                bool? isFocused,
              }) {
                // return Text('$currentLength/$maxLength');
                return AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  //color: Colors.green[100 * ((currentLength ?? 0) ~/ 2)],
                  height: 10,
                  width: 10.0 * (currentLength ?? 0),
                  color: Colors.green,
                );
              },
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              inputFormatters: [TextProjectInputFormmatter()._formmater],
              focusNode: focusNodeTextFieldOne,
              decoration: InputDecorator().emailInput,
            ),
          ),
          TextField(
            minLines: 2,
            maxLines: 4,
          )
        ],
      ),
    );
  }
}

class TextProjectInputFormmatter {
  final _formmater = TextInputFormatter.withFunction((oldValue, newValue) {
    if (oldValue.text == 'a') {
      return oldValue;
    }
    return newValue;
  });
}

class InputDecorator {
  final emailInput = const InputDecoration(
    prefixIcon: Icon(Icons.mail),
    labelText: LanguageItems.mailTitle,
    border: OutlineInputBorder(),
    // fillColor: Colors.white,
    // filled: true,
  );
}
