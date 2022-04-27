part of './login_view.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController textEditingController,
    required TextEditingController passwordEditingController,
    required String login,
  })  : _formKey = formKey,
        _textEditingController = textEditingController,
        _passwordEditingController = passwordEditingController,
        _login = login,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _textEditingController;
  final TextEditingController _passwordEditingController;
  final String _login;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isCompleted) {
          context.navigateToPage(const ImageLearn202());
        }
      },
      builder: (context, state) {
        return BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.read<LoginCubit>().checkUser(
                          _textEditingController.text,
                          _passwordEditingController.text,
                        );
                  }
                },
                child: Padding(
                  padding: const PagePadding.elevatedButtonPadding(),
                  child: Text('$_login - ${state.model?.email ?? ""}'),
                ));
          },
        );
      },
    );
  }
}

class _LoginEmailFields extends StatelessWidget {
  const _LoginEmailFields({
    Key? key,
    required TextEditingController emailEditingController,
    required TextEditingController passwordController,
  })  : _emailEditingController = emailEditingController,
        _paswordEditingController = passwordController,
        super(key: key);
  final TextEditingController _emailEditingController;
  final TextEditingController _paswordEditingController;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state,
          child: AnimatedOpacity(
            duration: context.durationLow,
            opacity: state ? 0.3 : 1.0,
            child: Column(
              children: [
                Padding(
                  padding: const PagePadding.bottom(),
                  child: TextFormField(
                    controller: _emailEditingController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (String? data) =>
                        (data?.isValidEmail ?? false) ? null : 'Please enter a valid email address',
                  ),
                ),
                Padding(
                  padding: const PagePadding.bottom(),
                  child: TextFormField(
                    controller: _paswordEditingController,
                    obscureText: true,
                    validator: (String? data) => ((data?.length ?? 0) > 6) ? null : 'Please enter a valid password',
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.bottom() : super.only(bottom: 10);
  const PagePadding.elevatedButtonPadding() : super.symmetric(horizontal: 60, vertical: 10);
}
