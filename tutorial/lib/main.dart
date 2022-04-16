import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial/101/card_learn.dart';
import 'package:tutorial/101/color_learn.dart';
import 'package:tutorial/101/column_row_learn.dart';
import 'package:tutorial/101/custom_widget_learn.dart';
import 'package:tutorial/101/image_learn.dart';
import 'package:tutorial/101/indicator_learn.dart';
import 'package:tutorial/101/list_tile_learn.dart';
import 'package:tutorial/101/padding_learn.dart';
import 'package:tutorial/101/stack_learn.dart';
import 'package:tutorial/101/stateless_learn.dart';
import 'package:tutorial/demos/note_demos_view.dart';
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
        listTileTheme: ListTileThemeData(
          contentPadding: EdgeInsets.zero,
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.red,
        ),
        errorColor: ColorsItems.errorColor,
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 38, 69, 223),
          onPrimary: Color.fromARGB(255, 255, 95, 95),
          onBackground: Color.fromARGB(255, 255, 255, 255),
          background: Color.fromARGB(255, 186, 182, 182),
          surface: Color.fromARGB(255, 252, 98, 98),
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
      home: StateDemoView(),
    );
  }
}
