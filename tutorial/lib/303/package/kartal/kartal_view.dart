import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tutorial/101/image_learn.dart';

typedef ImageLoader = Function(String url);

class KartalView extends StatefulWidget {
  const KartalView({Key? key, this.imageLoader}) : super(key: key);
  final ImageLoader? imageLoader;

  @override
  State<KartalView> createState() => _KartalViewState();
}

class _KartalViewState extends State<KartalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                context.navigateToPage(
                  const ImageLearn(),
                  type: SlideType.RIGHT,
                );
              },
              child: Text('Kartal', style: context.textTheme.headline1),
            ),
            InkWell(
              onTap: () {
                'gkandth@gmail.com'.launchEmail;
              },
              child: Text('Mail', style: context.textTheme.headline1),
            ),
            Icon(context.isIOSDevice ? Icons.ios_share : Icons.android),
            AnimatedContainer(
              duration: context.durationLow,
              height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.2),
              color: Colors.red,
            ),
            const TextField(),
            SizedBox(height: context.dynamicHeight(0.05)),
            Image.network('src'.randomImage),
            InkWell(
              onTap: () {
                'https://www.google.com'.launchWebsite;
              },
              child: Text(
                'Google',
                style: context.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
