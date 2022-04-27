import 'package:tutorial/404/bloc/feature/login/model/login_model.dart';
import 'package:tutorial/404/bloc/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager networkManager;
  ILoginService(this.networkManager);
  Future<IResponseModel<TokenModel?>?> login(LoginModel loginModel);

  final _loginPath = 'api/login';
}

class LoginService extends ILoginService {
  LoginService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<IResponseModel<TokenModel?>?> login(LoginModel loginModel) async {
    return await networkManager.send<TokenModel, TokenModel>(_loginPath,
        data: loginModel, parseModel: TokenModel(), method: RequestType.POST);
  }
}
