import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({Key? key, this.onNumber}) : super(key: key);
  final bool Function(int)? onNumber;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  // Random sayı don kontrol edip cevap vericem
  // Bu cevaba göre butonun rengini güncelle
  // Eğer doğru ise yeşil yanlış ise kırmızı
  Color? _backgroundColor;
  final String data = 'data';
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: _backgroundColor,
      ),
      child: Text(data),
      onPressed: () {
        final result = Random().nextInt(10);
        final response = widget.onNumber?.call(result) ?? false;
        setState(() {
          _backgroundColor = response ? Colors.green : Colors.red;
        });
      },
    );
  }
}
