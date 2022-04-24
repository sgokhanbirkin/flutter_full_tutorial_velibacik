// ignore_for_file: unused_field

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tutorial/303/reqres_resource/model/resource_model.dart';

abstract class IReqressService {
  final Dio dio;

  IReqressService(this.dio);

  Future<ResourceModel?> fetchResourceItems();
}

enum _ReqResPath { resource, unknown }

class ReqressService extends IReqressService {
  ReqressService(Dio dio) : super(dio);

  @override
  Future<ResourceModel?> fetchResourceItems() async {
    final response = await dio.get('/${_ReqResPath.unknown.name}');

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is Map<String, dynamic>) {
        return ResourceModel.fromJson(_datas);
      }
    }
    return null;
  }
}
