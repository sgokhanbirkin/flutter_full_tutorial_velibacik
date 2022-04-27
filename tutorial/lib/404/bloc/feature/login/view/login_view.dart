import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:tutorial/202/image_learn_202.dart';
import 'package:tutorial/404/bloc/feature/login/cubit/login_cubit.dart';
import 'package:tutorial/404/bloc/feature/login/cubit/login_cubit_state.dart';
import 'package:tutorial/404/bloc/feature/login/service/login_service.dart';
import 'package:tutorial/product/service/vexana_network_manager.dart';

part './login_view.g.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String _login = 'Login';
  final String _title = 'Login Page';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(VexanaNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.isLoading ? CircularProgressIndicator(color: context.colorScheme.secondary) : Text(_title);
            },
          ),
        ),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const PagePadding.all(),
            child: Column(
              children: [
                _LoginEmailFields(
                  emailEditingController: _textEditingController,
                  passwordController: _passwordEditingController,
                ),
                _LoginButton(
                    formKey: _formKey,
                    textEditingController: _textEditingController,
                    passwordEditingController: _passwordEditingController,
                    login: _login),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
