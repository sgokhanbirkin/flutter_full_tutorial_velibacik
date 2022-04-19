import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final String title = 'Form Learn View';
  final String submitButton = 'Submit';
  bool _isVisible = false;

  void changeCheckBox() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          // print('onChanged');
        },
        child: Column(
          children: [
            TextFormField(validator: FormFiledValidator().isNotEmpty),
            TextFormField(validator: FormFiledValidator().isNotEmpty),
            DropdownButtonFormField<String>(
              value: 'v',
              validator: FormFiledValidator().isNotEmpty,
              items: const [
                DropdownMenuItem(child: Text('a'), value: 'v'),
                DropdownMenuItem(child: Text('b'), value: 'v2'),
                DropdownMenuItem(child: Text('c'), value: 'v3'),
              ],
              onChanged: (value) {},
            ),
            CheckboxListTile(
                value: _isVisible,
                onChanged: (_) {
                  changeCheckBox();
                }),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // print('Okey');
                }
              },
              child: Text(submitButton),
            ),
          ],
        ),
      ),
    );
  }
}

class FormFiledValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage()._notEmpty;
  }
}

class ValidatorMessage {
  final String _notEmpty = 'Please enter some text';
}
