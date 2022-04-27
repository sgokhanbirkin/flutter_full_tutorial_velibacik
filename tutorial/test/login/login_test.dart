import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial/404/bloc/feature/login/model/login_model.dart';
import 'package:tutorial/404/bloc/feature/login/service/login_service.dart';
import 'package:tutorial/product/service/vexana_network_manager.dart';

void main() {
  late ILoginService loginService;
  //var baseUrl = 'https://reqres.in/';
  setUp(() {
    loginService = LoginService(VexanaNetworkManager());
  });
  test('Login Test', () async {
    final response = await loginService.login(LoginModel(email: 'eve.holt@reqres.in', password: 'cityslicka'));

    expect(response?.data, isNotNull);
  });
}
