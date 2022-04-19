import 'package:flutter/material.dart';

class PassWordTextField extends StatefulWidget {
  const PassWordTextField({Key? key, this.controller}) : super(key: key);
  final TextEditingController? controller;
  @override
  State<PassWordTextField> createState() => _PassWordTextFieldState();
}

class _PassWordTextFieldState extends State<PassWordTextField> {
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    var obscuringCharacter2 = '#';
    var hintText2 = 'Password';
    return TextField(
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure,
      obscuringCharacter: obscuringCharacter2,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: hintText2,
        suffix: _onVisibilityIcon(),
        //suffixIcon: const Icon(Icons.remove_red_eye),
      ),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
      //icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off),
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.visibility_outlined),
        secondChild: const Icon(Icons.visibility_off_outlined),
        crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(seconds: 2),
      ),
      onPressed: () {
        _changeLoading();
      },
    );
  }
}
