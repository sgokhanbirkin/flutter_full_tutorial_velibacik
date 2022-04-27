import 'package:flutter/material.dart';
import 'package:tutorial/202/cache/shared_preferences/shared_learn_cache.dart';

class SnippetLearn extends StatefulWidget {
  const SnippetLearn({Key? key}) : super(key: key);

  @override
  State<SnippetLearn> createState() => _SnippetLearnState();
}

class _SnippetLearnState extends LoadingStatefull<SnippetLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
