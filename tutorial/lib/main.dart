import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial/101/app_bar_learn_view.dart';
import 'package:tutorial/101/button_learn_view.dart';
import 'package:tutorial/101/color_learn_view.dart';
import 'package:tutorial/101/container_sized_box_learn_view.dart';
import 'package:tutorial/101/icon_learn_view.dart';
import 'package:tutorial/101/scaffold_learn_view.dart';
import 'package:tutorial/101/text_learn_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        // backgroundColor: Colors.red,
        // scaffoldBackgroundColor: Colors.red,
        // iconTheme: IconThemeData(
        //   color: Colors.white,
        // ),
        errorColor: ColorsItems.sulu,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ColorLearnView(),
    );
  }
}
