import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/data/repository/user_repository.dart';
import 'package:messenger_app/generated/l10n.dart';
import 'package:messenger_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:messenger_app/presentation/widgets/app_alert.dart';
import 'package:messenger_app/presentation/widgets/app_button.dart';
import 'package:messenger_app/theme/const.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final UserRepository userRepository = UserRepository();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        middle: Text(
          S.of(context).authorize,
          style: kAppBarTextStyle,
        ),
      ),
      child: SafeArea(
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                AutoRouter.of(context).replaceNamed('/chat');
              },
              error: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => AppAlertDialog(
                    title: S.of(context).wrongPasswordOrEmail,
                    onOkPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                  child: Column(
                    children: [
                      CupertinoTextField.borderless(
                        controller: emailController,
                        placeholder: S.of(context).email,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color(0xFFE0E6ED),
                      ),
                      CupertinoTextField.borderless(
                        controller: passwordController,
                        obscureText: true,
                        placeholder: S.of(context).password,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                if (state is Loading) ...{
                  const CupertinoActivityIndicator(radius: 20),
                } else ...{
                  AppButton(
                    text: S.of(context).signIn,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.read<UserBloc>().add(
                            UserEvent.loginEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                    },
                  ),
                },
                const SizedBox(height: 19),
                AppButton(
                  text: S.of(context).register,
                  onPressed: () {
                    AutoRouter.of(context).replaceNamed('/register');
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
