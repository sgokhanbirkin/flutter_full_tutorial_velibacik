// ignore_for_file: unused_local_variable, unused_element

import 'package:flutter/material.dart';

class AlertLearnView extends StatefulWidget {
  const AlertLearnView({Key? key}) : super(key: key);

  @override
  State<AlertLearnView> createState() => _AlertLearnViewState();
}

class _AlertLearnViewState extends State<AlertLearnView> {
  final String title = 'AlertView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
            //barrierDismissible: false,
            context: context,
            builder: (context) {
              //return UpdateDialog(context: context);
              return const _ImageZoomDialog();
            },
          );
          //print(response);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text('Update'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class Keys {
  static const versionUpdate = 'Version Update';
  static const update = 'Update';
  static const cancel = 'Cancel';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({
    Key? key,
    required BuildContext context,
  }) : super(
          key: key,
          title: const Text(Keys.versionUpdate),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text(Keys.update),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(Keys.cancel),
            ),
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    Key? key,
  }) : super(key: key);

  final String src = 'https://picsum.photos/200';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: SizedBox(
        child: InteractiveViewer(
          child: Image.network(
            src,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
        ),
      ),
    );
  }
}


// Dialog(
//                 child: Text(title),
//               );

          // showAboutDialog(
          //   context: context,
          //   applicationName: 'SGB',
          //   children: [
          //     Text(title),
          //   ],
          // );