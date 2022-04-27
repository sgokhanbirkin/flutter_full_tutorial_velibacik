import 'package:flutter/material.dart';
import 'package:tutorial/product/utility/image_upload_manager.dart';

class ImagePickerGenericView extends StatefulWidget {
  const ImagePickerGenericView({Key? key}) : super(key: key);

  @override
  State<ImagePickerGenericView> createState() => _ImagePickerGenericViewState();
}

class _ImagePickerGenericViewState extends State<ImagePickerGenericView> {
  //final _imageUploadManager = ImageUploadManager();
  late final ImageUploadGenericManager _imageUploadGenericManager;

  @override
  void initState() {
    super.initState();
    _imageUploadGenericManager = ImageUploadGenericManager(LibraryImageUpload());
  }

  @override
  Widget build(BuildContext context) {
    String title = 'Image Picker';
    var data3 = 'Fetch From Multiple';
    var data = 'Fetch From Galery';
    var data2 = 'Fetch From normal';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _imageUploadGenericManager.cropWithFetch();
              },
              child: Text(data),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(data2),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(data3),
            ),
          ],
        ),
      ),
    );
  }
}
