import 'package:flutter/material.dart';
import 'package:tutorial/202/oop_learn.dart';

class OopLearnView extends StatefulWidget {
  const OopLearnView({Key? key}) : super(key: key);

  @override
  State<OopLearnView> createState() => OopLearnViewState();
}

class OopLearnViewState extends State<OopLearnView> {
  FileDownload? download;
  @override
  void initState() {
    super.initState();
    download = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //actions: const [CircularProgressIndicator(color: Colors.white)],
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          download?.downloadItem(null);
        },
      ),
    );
  }
}
