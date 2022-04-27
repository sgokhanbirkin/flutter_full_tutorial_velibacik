import 'package:equatable/equatable.dart';
import 'package:tutorial/404/bloc/feature/login/model/login_model.dart';
import 'package:tutorial/404/bloc/product/model/token_model.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final LoginModel? model;
  final TokenModel? tokenModel;
  final bool isCompleted;
  const LoginState({
    this.model,
    this.isLoading = false,
    this.tokenModel,
    this.isCompleted = false,
  });

  @override
  List<Object?> get props => [isLoading, model];

  LoginState copyWith({
    bool? isLoading,
    LoginModel? model,
    TokenModel? tokenModel,
    bool? isCompleted,
  }) {
    return LoginState(
      isLoading: isLoading ?? false,
      model: model ?? this.model,
      tokenModel: tokenModel ?? this.tokenModel,
      isCompleted: isCompleted ?? false,
    );
  }
}
