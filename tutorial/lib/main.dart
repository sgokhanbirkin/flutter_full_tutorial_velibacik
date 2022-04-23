import 'package:flutter/material.dart';
import 'package:tutorial/303/lottie_learn_view.dart';
import 'package:tutorial/303/reqres_resource/view/reqres_provider_view.dart';

import 'package:provider/provider.dart';
import 'package:tutorial/product/constant/project_items.dart';
import 'package:tutorial/product/global/resource_context.dart';
import 'package:tutorial/product/global/theme_notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(create: ((context) => ThemeNotifier()))
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectItems.projectName,
      theme: context.watch<ThemeNotifier>().currentTheme,
      // theme: ThemeData.dark().copyWith(
      //   bottomAppBarTheme: const BottomAppBarTheme(
      //     shape: CircularNotchedRectangle(),
      //   ),
      //   tabBarTheme: const TabBarTheme(
      //     labelColor: Colors.green,
      //     unselectedLabelColor: Colors.red,
      //     indicator: BoxDecoration(
      //       border: Border(
      //         bottom: BorderSide(
      //           color: Colors.green,
      //           width: 2,
      //         ),
      //       ),
      //     ),
      //   ),

      //   // backgroundColor: Colors.red,
      //   // scaffoldBackgroundColor: Colors.red,
      //   // iconTheme: IconThemeData(
      //   //   color: Colors.white,
      //   // ),
      //   listTileTheme: const ListTileThemeData(
      //     contentPadding: EdgeInsets.zero,
      //   ),
      //   cardTheme: CardTheme(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //   ),
      //   // progressIndicatorTheme: const ProgressIndicatorThemeData(
      //   //   color: Colors.red,
      //   // ),
      //   // errorColor: ColorsItems.errorColor,
      //   // colorScheme: const ColorScheme.dark(
      //   //   primary: Color.fromARGB(255, 17, 94, 236),
      //   //   onPrimary: Color.fromARGB(255, 255, 255, 255),
      //   //   onBackground: Color.fromARGB(255, 255, 255, 255),
      //   //   background: Color.fromARGB(255, 186, 182, 182),
      //   //   surface: Color.fromARGB(255, 252, 98, 98),
      //   //   error: ColorsItems.errorColor,
      //   // ),
      //   inputDecorationTheme: const InputDecorationTheme(
      //     filled: true,
      //     fillColor: Colors.white,
      //     iconColor: Colors.red,
      //     border: OutlineInputBorder(),
      //     labelStyle: TextStyle(color: Colors.red),
      //     hintStyle: TextStyle(color: Colors.red),
      //   ),
      //   textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.red, fontSize: 20)),
      //   appBarTheme: const AppBarTheme(
      //     centerTitle: true,
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     systemOverlayStyle: SystemUiOverlayStyle.light,
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      home: const LottieLearnView(),
    );
  }
}
