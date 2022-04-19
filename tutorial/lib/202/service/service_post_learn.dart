import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tutorial/202/service/post_model.dart';
import 'package:dio/dio.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String title = 'Post Items';
  bool _isLoading = false;
  late final Dio _networkManager;
  final String baseUrl = 'https://jsonplaceholder.typicode.com/';

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  Future<void> _addItemToService(PostModel model) async {
    _changeLoadingState();
    final response = await _networkManager.post('posts', data: model);

    if (response.statusCode == HttpStatus.created) {
      title = 'Basarili';
    }
    _changeLoadingState();
  }

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }

  void _changeLoadingState() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isLoading ? const LinearProgressIndicator() : Text(title),
      ),
      body: Column(
        children: [
          TextField(
            controller: _idController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Enter Post Id',
            ),
            autofillHints: const [AutofillHints.creditCardNumber],
          ),
          TextField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Enter Post Title',
            ),
          ),
          TextField(
            controller: _bodyController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: 'Enter Post Body',
            ),
          ),
          TextButton(
            onPressed: _isLoading
                ? null
                : () {
                    if (_titleController.text.isNotEmpty &&
                        _bodyController.text.isNotEmpty &&
                        _idController.text.isNotEmpty) {
                      final model = PostModel(
                        id: int.parse(_idController.text),
                        title: _titleController.text,
                        body: _bodyController.text,
                      );
                      _addItemToService(model);
                    }
                  },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final PostModel? item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PagePadding().bottom,
      child: ListTile(
        title: Text(item?.title ?? ''),
        subtitle: Text(item?.body ?? ''),
      ),
    );
  }
}

class PagePadding {
  final EdgeInsets symmetric = const EdgeInsets.symmetric(horizontal: 10);
  final EdgeInsets bottom = const EdgeInsets.only(bottom: 20);
}
