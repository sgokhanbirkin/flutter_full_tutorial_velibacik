import 'package:dio/src/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/303/reqres_resource/model/resource_model.dart';
import 'package:tutorial/303/reqres_resource/service/reqres_service.dart';
import 'package:tutorial/303/reqres_resource/viewModel/reqres_provider.dart';
import 'package:tutorial/303/testable/user_save_model.dart';

@GenerateMocks([ReqResProvider])
void main() {
  setUp(() {
    Map<String, Object> values = <String, Object>{'vb': 'veli'};
    SharedPreferences.setMockInitialValues(values);
  });
  // test('saveToLocale - Test ', () {
  //   var mockProvider = ReqResProvider(ReqressService(Dio()));
  //   final resourceContext = ResourceContext();
  //   final result = mockProvider.saveToLocale(resourceContext, []);

  //   expect(result, []);
  // });
  test('getReadData - Test ', () async {
    var userViewModel = UserSaveViewModel();
    final result = userViewModel.getReadData('vb', SharedPrefStore(await SharedPreferences.getInstance()));
    expect(result, true);
  });

  test('fetchItems - Test ', () async {
    var mockProvider = ReqResProvider(MockReqResService());
    final result = await mockProvider.fetchItems();

    expect(result, isNotEmpty);
  });
}

class MockReqResService extends IReqressService {
  MockReqResService() : super(Dio());

  @override
  Future<ResourceModel?> fetchResourceItems() async {
    return ResourceModel(data: [const Data(id: 1, name: 'veli')]);
  }
}
