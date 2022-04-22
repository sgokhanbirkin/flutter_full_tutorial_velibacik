// ignore_for_file: hash_and_equals

import 'package:flutter/material.dart';
import 'package:tutorial/product/widget/answer_button.dart';
import 'package:tutorial/product/widget/callback_dropdown.dart';
import 'package:tutorial/product/widget/loading_button.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  //CallbackUser? _user;
  final String title = 'Call back';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          CallBackDropDown(onUserSelected: (CallbackUser user) {
            //print(user);
          }),
          AnswerButton(
            onNumber: (number) {
              return number % 3 == 1;
            },
          ),
          LoadingButton(
              title: 'Save',
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 3));
              })
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;
  CallbackUser(this.name, this.id);

  // TODO Dummy Remove it
  static List<CallbackUser> dummyUsers() {
    return [
      CallbackUser('User 1', 1),
      CallbackUser('User 2', 2),
      CallbackUser('User 3', 3),
      CallbackUser('User 4', 4),
      CallbackUser('User 5', 5),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CallbackUser && name == other.name && id == other.id;
  }
}
