import 'package:tutorial/202/cache/shared_preferences/shared_learn_cache.dart';
import 'package:tutorial/303/reqres_resource/model/resource_model.dart';
import 'package:tutorial/303/reqres_resource/service/reqres_service.dart';
import 'package:tutorial/303/reqres_resource/view/reqres_view.dart';
import 'package:tutorial/product/service/project_dio.dart';
import 'package:tutorial/product/service/project_network_manager.dart';

abstract class ReqResViewModel extends LoadingStatefull<ReqResView> with ProjectDioMixin {
  late final ReqressService reqResService;
  List<Data> resourceItems = [];
  @override
  void initState() {
    super.initState();
    reqResService = ReqressService(ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance.addBaseHeader('veli');
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resourceItems = (await reqResService.fetchResourceItems())?.data ?? [];
    changeLoading();
  }
}
