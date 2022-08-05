import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial/101/image_learn.dart';

class NodeDemosView extends StatelessWidget {
  const NodeDemosView({Key? key}) : super(key: key);
  final _title = 'Create your firs note';
  final _description =
      'Add a note abbout anything (your thougths on climate change, or your history essay and share it witht the world.';
  final _createNote = 'Create Note';
  final _note = 'Import Notes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.pagePaddingHorizontal,
        child: Column(
          children: [
            PngImage(path: ImageItems().appleBookWithoutPath),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.pagePaddingVertical,
              child: _SubtitleWidget(
                data: _description,
              ),
            ),
            const Spacer(),
            _createMethod(context),
            TextButton(
              onPressed: () {},
              child: Text(_note),
            ),
            const SizedBox(height: ButtonHeights.buttonNormalHeight),
          ],
        ),
      ),
    );
  }

  ElevatedButton _createMethod(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: SizedBox(
        height: ButtonHeights.buttonNormalHeight,
        child: Center(
          child: Text(
            _createNote,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}

// Center text widget
class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget({
    Key? key,
    this.textAlign = TextAlign.center,
    required this.data,
  }) : super(key: key);
  final TextAlign textAlign;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
    );
  }
}

class PaddingItems {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);
  static const pagePaddingHorizontal = EdgeInsets.symmetric(horizontal: 20);
}

class ButtonHeights {
  static const double buttonNormalHeight = 50;
}
