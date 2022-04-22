import 'package:flutter/cupertino.dart';
import 'package:tutorial/303/reqres_resource/model/resource_model.dart';
import 'package:tutorial/303/reqres_resource/service/reqres_service.dart';
import 'package:tutorial/product/global/resource_context.dart';

class ReqResProvider extends ChangeNotifier {
  final ReqressService reqResService;
  List<Data> resourceItems = [];
  bool isLoading = false;

  ReqResProvider(this.reqResService) {
    _fetch();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resourceItems = (await reqResService.fetchResourceItems())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resourceItems));
  }
}
