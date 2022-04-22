import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/202/cache/shared_preferences/shared_learn_cache.dart';
import 'package:tutorial/303/reqres_resource/model/resource_model.dart';
import 'package:tutorial/303/reqres_resource/service/reqres_service.dart';
import 'package:tutorial/303/reqres_resource/view/reqres_view.dart';
import 'package:tutorial/product/service/project_dio.dart';

abstract class ReqResViewModel extends LoadingStatefull<ReqResView> with ProjectDioMixin {
  late final ReqressService reqResService;
  List<Data> resourceItems = [];
  @override
  void initState() {
    super.initState();
    reqResService = ReqressService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resourceItems = (await reqResService.fetchResourceItems())?.data ?? [];
    changeLoading();
  }
}
