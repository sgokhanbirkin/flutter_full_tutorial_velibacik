import 'package:flutter/material.dart';

class NavigateHomeDetailView extends StatefulWidget {
  const NavigateHomeDetailView({Key? key, this.id}) : super(key: key);
  final String? id;

  @override
  State<NavigateHomeDetailView> createState() => _NavigateHomeDetailViewState();
}

class _NavigateHomeDetailViewState extends State<NavigateHomeDetailView> {
  String? _id;

  @override
  void initState() {
    super.initState();

    _id = widget.id ?? '';
    Future.microtask(() {
      final _modelId = ModalRoute.of(context)?.settings.arguments;

      setState(() {
        _modelId is String ? _id = _modelId : _id = widget.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_id ?? ''),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Navigate to Profile View'),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
          },
        ),
      ),
    );
  }
}
