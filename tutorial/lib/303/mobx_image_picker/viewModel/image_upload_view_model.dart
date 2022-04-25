import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:tutorial/303/mobx_image_picker/service/image_upload_service.dart';

import '../model/image_upload_response.dart';
part 'image_upload_view_model.g.dart';

class ImageUploadViewModel = _ImageUploadViewModelBase with _$ImageUploadViewModel;

abstract class _ImageUploadViewModelBase with Store {
  static const _baseUrl = 'https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com/o/';
  @observable
  String imageUrl = '';

  @observable
  String downloadText = '';
  @observable
  bool isLoading = false;
  @observable
  File? file;
  final ImageUploadService _imageUploadService = ImageUploadService(
    dio: Dio(
      BaseOptions(baseUrl: _baseUrl),
    ),
  );

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void uploadImageUrl(ImageUploadResponse? response) {
    if (response == null) return;
    imageUrl = _baseUrl + (response.name?.replaceFirst('/', '%2F') ?? '');
    //print('imageUrl: $imageUrl');
  }

  void init() {}
  @action
  void saveLocaleFile(XFile? file) {
    if (file == null) return;
    this.file = File(file.path);
  }

  @action
  void updateDownloadText(int send, int total) {
    downloadText = '$send / $total';
  }

  Future<void> saveDataToServer() async {
    if (file == null) return;
    final response = await _imageUploadService.uploadImageToServer(await file!.readAsBytes(), 'birkin',
        onSendProgress: (send, total) {
      updateDownloadText(send, total);
    });
    //print('Response : $response');
    uploadImageUrl(response);
  }
}
