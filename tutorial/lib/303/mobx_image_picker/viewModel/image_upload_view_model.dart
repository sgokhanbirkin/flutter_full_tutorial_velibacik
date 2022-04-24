import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'image_upload_view_model.g.dart';

class ImageUploadViewModel = _ImageUploadViewModelBase with _$ImageUploadViewModel;

abstract class _ImageUploadViewModelBase with Store {
  @observable
  bool isLoading = false;
  @observable
  File? file;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  void init() {}
  @action
  void saveLocaleFile(XFile? file) {
    if (file == null) return;
    this.file = File(file.path);
    print('TEST');
  }
}
