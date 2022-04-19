import 'dart:io';

import 'package:tutorial/202/custom_exception_learn.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  void toShare(String path) async {
    await launch(path);
  }
}

class FileDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    print('A');
    return true;
  }

  @override
  void toShare(String path) async {
    await launch(path);
  }
}

class SmsDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    print('A');
    return true;
  }

  @override
  void toShare(String path) async {
    await launch('sms:$path');
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

mixin ShareMixin on IFileDownload {
  void toShowFile() {}
}
