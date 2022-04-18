import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tutorial/202/service/comments_learn_view.dart';
import 'package:tutorial/202/service/post_model.dart';
import 'package:dio/dio.dart';
import 'package:tutorial/202/service/post_service.dart';

class ServiceLearnView extends StatefulWidget {
  const ServiceLearnView({Key? key}) : super(key: key);

  @override
  State<ServiceLearnView> createState() => _ServiceLearnViewState();
}

class _ServiceLearnViewState extends State<ServiceLearnView> {
  String title = 'Service View';
  List<PostModel>? _items;
  bool isLoading = false;
  late final Dio _networkManager;
  final String baseUrl = 'https://jsonplaceholder.typicode.com/';

  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
    _postService = PostService();
    title = 'Get Posts';
    fetchPostItems();
  }

  Future<void> fetchPostItems() async {
    changeLoadingState();
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    changeLoadingState();
  }

  Future<void> fetchPostItemsAdvance() async {
    changeLoadingState();
    _items = await _postService.fetchPostItemsAdvance();
    changeLoadingState();
  }

  void changeLoadingState() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? const LinearProgressIndicator() : Text(title),
      ),
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
              padding: PagePadding().symmetric,
              itemCount: _items?.length ?? 0,
              itemBuilder: ((context, index) {
                var item = _items?.elementAt(index);
                return _PostCard(item: item);
              }),
            ),
    );
  }
}

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
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CommentsLearnView(
                    postId: item?.id,
                  )));
        },
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
