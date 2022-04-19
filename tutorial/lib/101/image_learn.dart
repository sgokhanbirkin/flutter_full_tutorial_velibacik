import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({Key? key}) : super(key: key);
  final String _imagePath =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Apple-book.svg/2036px-Apple-book.svg.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: 300,
                child: PngImage(path: ImageItems().appleBookWithoutPath),
              ),
              // Image.asset(
              //   'assets/images/test.png',
              //   fit: BoxFit.cover,
              //   height: 100,
              // ),
              Image.network(
                _imagePath,
                errorBuilder: ((context, error, stackTrace) => const Icon(Icons.abc_outlined)),
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageItems {
  final String appleWithBook = 'assets/images/png/ic_apple_with_school.png';
  final String appleBookWithoutPath = 'ic_apple_with_school';
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.path}) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.cover,
    );
  }

  String get _nameWithPath => 'assets/images/png/$path.png';
}
