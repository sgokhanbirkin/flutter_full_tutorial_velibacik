import 'package:flutter/material.dart';
import 'package:tutorial/202/service/post_comment_model.dart';
import 'package:tutorial/202/service/post_service.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({Key? key, this.postId}) : super(key: key);
  final int? postId;
  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  late final IPostService _postService;
  bool isLoading = false;
  List<PostCommentModel>? _commentItems;
  @override
  void initState() {
    super.initState();
    _postService = PostService();
    fetchItemsWithId(widget.postId ?? 0);
  }

  void fetchItemsWithId(int postId) async {
    changeLoadingState();
    _commentItems = await _postService.fetchRelatedCommentsWithPostId(postId);
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
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _commentItems?.length ?? 0,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              subtitle: Text(
                _commentItems?.elementAt(index).body ?? '',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
