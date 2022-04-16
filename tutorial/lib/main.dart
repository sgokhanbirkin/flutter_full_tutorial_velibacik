import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial/101/card_learn.dart';
import 'package:tutorial/101/color_learn.dart';
import 'package:tutorial/101/image_learn.dart';
import 'package:tutorial/101/padding_learn.dart';
import 'package:tutorial/101/stateless_learn.dart';
import 'package:tutorial/demos/note_demos_view.dart';

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
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        errorColor: ColorsItems.errorColor,
        colorScheme: const ColorScheme.dark(
          primary: ColorsItems.porchase,
          onPrimary: ColorsItems.sulu,
          onBackground: ColorsItems.sulu,
          background: ColorsItems.sulu,
          surface: ColorsItems.sulu,
          error: ColorsItems.errorColor,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: NodeDemosView(),
    );
  }
}
