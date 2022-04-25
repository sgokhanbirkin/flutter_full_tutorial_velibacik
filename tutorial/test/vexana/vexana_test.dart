import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

import 'model_unknown.dart';

void main() {
  late final INetworkManager networkManager;

  setUp(() {
    networkManager = NetworkManager(options: BaseOptions(baseUrl: 'https://reqres.in/api'));
  });
  test('Vexana Test', () async {
    final response = await networkManager.send<UnknownModel, UnknownModel>(
      '/unknown',
      parseModel: UnknownModel(),
      method: RequestType.GET,
    );

    if (response.error?.response != null) {
      //print(response.error?.response.data);
    }
  });
}
