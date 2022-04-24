import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:tutorial/303/mobx_image_picker/viewModel/image_upload_view_model.dart';
import 'package:tutorial/product/utility/image_upload.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({Key? key}) : super(key: key);

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  final String _data = 'Image Upload';
  final String _lottieUrl = 'https://assets5.lottiefiles.com/packages/lf20_uzvo0utc.json';
  final _imageUploadViewModel = ImageUploadViewModel();
  final _imageUploadManager = ImageUploadManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_data),
          actions: [
            Observer(
              builder: (_) {
                return _imageUploadViewModel.isLoading ? const CircularProgressIndicator() : const SizedBox();
              },
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Card(
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                      child: Observer(
                        builder: (contex) {
                          return _imageUploadViewModel.file != null
                              ? Image.file(_imageUploadViewModel.file!)
                              : const SizedBox();
                        },
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        child: IconButton(
                          icon: Lottie.network(_lottieUrl),
                          onPressed: () async {
                            //_imageUploadManager.fetchFromLibrary();
                            _imageUploadViewModel.saveLocaleFile(await _imageUploadManager.fetchFromLibrary());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 4,
              child: Observer(
                builder: (contex) {
                  return _imageUploadViewModel.file != null
                      ? Image.file(_imageUploadViewModel.file!)
                      : const SizedBox();
                },
              ),
            )
          ],
        ));
  }
}
