import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_service.dart';
import '../../../core/style/text_style.dart';
import '../../data/param/login_param.dart';
import '../bloc/login/login_bloc.dart';
import 'circular_progress_indicator_default.dart';
import 'container_primary.dart';

class BtnDoLogin extends StatefulWidget {
  const BtnDoLogin({
    super.key,
    required this.usesrnameTextController,
    required this.passwordTextController,
  });

  final TextEditingController usesrnameTextController;
  final TextEditingController passwordTextController;

  @override
  State<BtnDoLogin> createState() => _BtnDoLoginState();
}

class _BtnDoLoginState extends State<BtnDoLogin> {
  late LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = Modular.get<LoginBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (context, state) {
        if (state is LoginFailureTotp) {
          if (state.message.contains("Invalid TOTP code")) {
            const snackBar = SnackBar(
              content: Text('Informe o código totp para continuar'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            var param = LoginParam(
                username: widget.usesrnameTextController.text,
                password: widget.passwordTextController.text,
                totp_code: '');

            Modular.to.pushNamed("recovery-secret", arguments: param);
          }
        }
        if (state is LoginFailure) {
          const snackBar = SnackBar(
            content: Text('Informe credenciais válidas para continuar :)'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is LoginSuccess) {
          const snackBar = SnackBar(
            content: Text('Login realizado com sucesso'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Modular.to.pushNamed("/home/");
        }
      },
      builder: (context, state) {
        return state is LoginProgress
            ? const ContainerPrimary(
                child: CircularProgressIndicatorDefault(),
              )
            : GestureDetector(
                onTap: () {
                  String totpCode = Modular.get<AppService>().totpCode;

                  var param = LoginParam(
                    username: widget.usesrnameTextController.text,
                    password: widget.passwordTextController.text,
                    totp_code: totpCode,
                  );
                  loginBloc.add(LoginStarted(param));
                },
                child: ContainerPrimary(
                  child: Text(
                    "Entrar",
                    textAlign: TextAlign.center,
                    style: Style.whiteStyle,
                  ),
                ));
      },
    );
  }
}