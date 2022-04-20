import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum _SecureKeys {
  token,
}

class SecureContextView extends StatefulWidget {
  const SecureContextView({Key? key}) : super(key: key);

  @override
  State<SecureContextView> createState() => _SecureContextViewState();
}

class _SecureContextViewState extends State<SecureContextView> {
  final _storage = const FlutterSecureStorage();
  String _title = '';
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems() async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';
    if (_title.isNotEmpty) {
      print('token: $_title');
      _controller.text = _title;
    }
    setState(() {});
  }

  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _storage.write(key: _SecureKeys.token.name, value: _title);
        },
        label: const Text('Save'),
      ),
      body: Center(
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Enter your password',
          ),
          onChanged: saveItems,
          minLines: 3,
          maxLines: 4,
        ),
      ),
    );
  }
}
