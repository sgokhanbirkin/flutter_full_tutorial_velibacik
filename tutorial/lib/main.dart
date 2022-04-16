import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial/101/color_learn.dart';
import 'package:tutorial/101/page_view_learn.dart';
import 'package:tutorial/101/statefull_learn.dart';
import 'package:tutorial/101/statefull_life_cycle_learn.dart';
import 'package:tutorial/101/text_field_learn.dart';
import 'package:tutorial/demos/stack_demo_view.dart';

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
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.zero,
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.red,
        ),
        errorColor: ColorsItems.errorColor,
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 17, 94, 236),
          onPrimary: Color.fromARGB(255, 255, 255, 255),
          onBackground: Color.fromARGB(255, 255, 255, 255),
          background: Color.fromARGB(255, 186, 182, 182),
          surface: Color.fromARGB(255, 252, 98, 98),
          error: ColorsItems.errorColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          iconColor: Colors.red,
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.red),
          hintStyle: TextStyle(color: Colors.red),
        ),
        textTheme: TextTheme(subtitle1: TextStyle(color: Colors.red, fontSize: 20)),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const TextFieldLearn(),
    );
  }
}
