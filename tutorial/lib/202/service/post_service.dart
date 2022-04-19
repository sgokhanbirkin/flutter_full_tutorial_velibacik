import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tutorial/202/service/post_comment_model.dart';

import 'package:tutorial/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel model);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<bool> putItemToService(PostModel model, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostCommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio _networkManager;
  PostService()
      : _networkManager = Dio(
          BaseOptions(
            baseUrl: 'https://jsonplaceholder.typicode.com/',
          ),
        );

  @override
  Future<bool> addItemToService(PostModel model) async {
    try {
      final response = await _networkManager.post(_PostServicePath.posts.name, data: model);

      return response.statusCode == HttpStatus.created;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _networkManager.get(_PostServicePath.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      } else {
        return null;
      }
      return null;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return null;
  }

  @override
  Future<bool> putItemToService(PostModel model, int id) async {
    try {
      final response = await _networkManager.put('${_PostServicePath.posts.name}/id', data: model);

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _networkManager.delete('${_PostServicePath.posts.name}/id');

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return false;
  }

  @override
  Future<List<PostCommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response = await _networkManager
          .get(_PostServicePath.posts.name, queryParameters: {_PostQueryPaths.postId.name: postId});
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          var response = _datas.map((e) => PostCommentModel.fromJson(e)).toList();
          return response;
        }
      }
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return null;
  }
}

// ignore: unused_field
enum _PostServicePath { posts, comments }
enum _PostQueryPaths { postId }

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print('_______________________');
      print(error.message);
      print(type);
    }
  }
}
