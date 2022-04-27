import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

import 'model_unknown.dart';

void main() {
  late final INetworkManager networkManager;
  setUp(() {
    networkManager = NetworkManager(
      options: BaseOptions(baseUrl: 'https://reqres.in/api'),
    );
  });
  test('Vexana test', () async {
    // ignore: unused_local_variable
    final response = await networkManager.send<UnknownModel, UnknownModel>('/unkown',
        parseModel: UnknownModel(), method: RequestType.GET);
  });
}
