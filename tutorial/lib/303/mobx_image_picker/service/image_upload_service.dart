import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:tutorial/303/mobx_image_picker/model/image_upload_response.dart';

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

  Future<ImageUploadResponse?> uploadImageToServer(Uint8List byteArray, String name,
      {void Function(int, int)? onSendProgress}) async {
    // var formData = await FormData.fromMap({
    //   'file': MultipartFile.fromBytes(byteArray, filename: name),
    // });

    final response = await dio.post('full%2F$name.png', data: byteArray, onSendProgress: (int sent, int total) {
      //print('$sent $total');
    });

    if (response.statusCode == HttpStatus.ok) {
      // final responseData  = Null Check
      return ImageUploadResponse.fromJson(response.data);
    }
    return null;
  }
}
