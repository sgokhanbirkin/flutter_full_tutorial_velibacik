import 'package:flutter/material.dart';
import 'package:tutorial/303/reqres_resource/viewModel/reqres_view_model.dart';
import 'package:tutorial/product/extension/string_extension.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({Key? key}) : super(key: key);

  @override
  State<ReqResView> createState() => ReqResViewState();
}

class ReqResViewState extends ReqResViewModel {
  final String title = 'Reqres View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? const CircularProgressIndicator() : Text(title),
      ),
      body: ListView.builder(
        itemCount: resourceItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Color(resourceItems[index].color?.colorValue ?? 0),
            child: Text(
              resourceItems[index].name ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        },
      ),
    );
  }
}
