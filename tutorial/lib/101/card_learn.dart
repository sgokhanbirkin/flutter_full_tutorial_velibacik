import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // Card(
            //   margin: ProjectMargins.pageMargin,
            //   shadowColor: Colors.white,
            //   color: Colors.white,
            //   child: SizedBox(
            //     height: 100,
            //     width: 500,
            //   ),
            //   shape: StadiumBorder(),
            // ),
            // Card(
            //   margin: ProjectMargins.pageMargin,
            //   shadowColor: Colors.white,
            //   color: Colors.white,
            //   child: SizedBox(
            //     height: 100,
            //     width: 500,
            //     child: Text(''),
            //   ),
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10)),
            // ),
            // Card(
            //   margin: ProjectMargins.pageMargin,
            //   shadowColor: Theme.of(context).colorScheme.onPrimary,
            //   child: SizedBox(
            //     height: 100,
            //     width: 100,
            //   ),
            // ),
            _CustomCard(
              child: SizedBox(
                height: 100,
                width: 300,
                child: Center(
                  child: Text('Gökhan'),
                ),
              ),
            ),
            _CustomCard(
              child: SizedBox(
                height: 100,
                width: 300,
                child: Center(
                  child: Text('Gökhan'),
                ),
              ),
            ),
            _CustomCard(
              child: SizedBox(
                height: 100,
                width: 300,
                child: Center(
                  child: Text('Gökhan'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectMargins {
  static const pageMargin = EdgeInsets.all(10);
}

// Borders
// StadiumBorder()
// CircleBorder()
// RoundedRectangleBorder()

class _CustomCard extends StatelessWidget {
  _CustomCard({Key? key, required this.child}) : super(key: key);
  final Widget child;
  // final roundenRectangleBorder = BorderRadius.circular(20);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.pageMargin,
      shadowColor: Colors.white,
      child: child,
    );
  }
}
