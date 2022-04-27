import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

import '../../generated/locale_keys.g.dart';

class ComputeLearnView extends StatefulWidget {
  const ComputeLearnView({Key? key}) : super(key: key);
  @override
  State<ComputeLearnView> createState() => _ComputeLearnViewState();
}

class _ComputeLearnViewState extends State<ComputeLearnView> {
  @override
  Widget build(BuildContext context) {
    int _result = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Compute Learn, Result : $_result'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //jsonDecode(string);
          // int result = 0;
          // for (var i = 0; i < 1000; i++) {
          //   result = i * i;
          // }
          final result = await compute(Calculator.sum, 10);

          setState(() {
            _result = result;
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const CircularProgressIndicator(),
          Text(LocaleKeys.login_welcome.tr()),
          const LoadingWidget(),
        ],
      ),
    );
  }
}

class Calculator {
  static int sum(int limit) {
    int result = 0;
    for (var i = 0; i < limit; i++) {
      result = result * i;
    }
    return result;
  }
}
