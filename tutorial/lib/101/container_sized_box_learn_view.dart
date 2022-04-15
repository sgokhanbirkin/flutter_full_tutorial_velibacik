import 'package:flutter/material.dart';

class ContainerSizedBoxLearnView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // SizedBox(
          //   width: 300,
          //   height: 200,
          //   child: Text(
          //     'a' * 500,
          //   ),
          // ),
          // const SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text(
              'b' * 50,
            ),
          ),
          Container(
            //height: 50,
            //color: Colors.red,
            constraints: const BoxConstraints(
              maxWidth: 50,
              minWidth: 10,
              maxHeight: 300,
              minHeight: 25,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
            child: Text('aa' * 100),
          ),
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    //color: Colors.red,
    border: Border.all(
      color: Colors.white,
      width: 2,
    ),
    //shape: BoxShape.circle,
    gradient: const LinearGradient(
      colors: [
        Colors.orange,
        Colors.black,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.yellow,
        blurRadius: 50,
        spreadRadius: 10,
        offset: Offset(0.1, 1),
      ),
    ],
    borderRadius: const BorderRadius.all(
      Radius.circular(10),
    ),
  );
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          //color: Colors.red,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          //shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [
              Colors.red,
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.yellow,
              blurRadius: 50,
              spreadRadius: 10,
              offset: Offset(0.1, 1),
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        );
}
