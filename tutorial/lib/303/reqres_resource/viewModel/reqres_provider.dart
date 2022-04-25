import 'package:flutter/cupertino.dart';
import 'package:tutorial/303/reqres_resource/model/resource_model.dart';
import 'package:tutorial/303/reqres_resource/service/reqres_service.dart';
import 'package:tutorial/product/global/resource_context.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqressService reqResService;
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
    resourceItems = await fetchItems();
    _changeLoading();
  }

  Future<List<Data>> fetchItems() async {
    return (await reqResService.fetchResourceItems())?.data ?? [];
  }

  bool? saveToLocale(ResourceContext resourceContext, List<Data> resourceItems) {
    resourceContext.saveModel(ResourceModel(data: resourceItems));
    return resourceContext.model?.data?.isNotEmpty;
  }
}
