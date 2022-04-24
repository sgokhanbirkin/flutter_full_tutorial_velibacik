import 'dart:typed_data';

import 'package:dio/dio.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService({required this.dio});

  // var formdata = FormData.fromMap(
  //   {
  //     'file': MultipartFile.fromBytes(
  //       Uint8List.fromList([]),
  //       filename: '',
  //     ),
  //   },
  // );
  //https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com
  //

  Future<void> uploadImageToServer(Uint8List byteArray, String name) async {
    // var formData = await FormData.fromMap({
    //   'file': MultipartFile.fromBytes(byteArray, filename: name),
    // });

    await dio.post('full%2F&name.png', data: byteArray, onSendProgress: (int sent, int total) {
      print('$sent $total');
    });
  }
}
