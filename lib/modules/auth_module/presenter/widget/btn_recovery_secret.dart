// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/modules/auth_module/data/param/login_param.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_service.dart';
import '../../../core/style/text_style.dart';
import '../../data/param/recovery_secret_param.dart';
import '../bloc/recovery_pass/recovery_secret_bloc.dart';
import 'circular_progress_indicator_default.dart';
import 'container_primary.dart';

class BtnRecoverySecret extends StatefulWidget {
  const BtnRecoverySecret({super.key, required this.codeTextController, required this.loginParam});

  final TextEditingController codeTextController;
  final LoginParam loginParam;

  @override
  State<BtnRecoverySecret> createState() => _BtnRecoverySecretState();
}

class _BtnRecoverySecretState extends State<BtnRecoverySecret> {
  late RecoverySecretBloc recoverySecretBloc;
  @override
  void initState() {
    recoverySecretBloc = Modular.get<RecoverySecretBloc>();
    super.initState();
  }

  int textLenght() => widget.codeTextController.text.length;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecoverySecretBloc, RecoverySecretState>(
      bloc: recoverySecretBloc,
      listener: (context, state) {
        if (state is RecoverySecretFailure) {
          const snackBar = SnackBar(
            content: Text('Código inválido'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is RecoverySecretSuccess) {
          const snackBar = SnackBar(
            content: Text('Código salvo, faça o login para prosseguir'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //save TOTP NUMBER this um AppService to use in loginPage
          Modular.get<AppService>().totpCode = state.totpCode;
          Modular.to.pop();
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: textLenght() < 6 || state is RecoverySecretProgress,
          child: GestureDetector(
            onTap: () {
              String username = widget.loginParam.username;
              String password = widget.loginParam.password;
              RecoverySecretParam param =
                  RecoverySecretParam(username: username, password: password, code: widget.codeTextController.text);
              recoverySecretBloc.add(RecoverySecretStarted(param));
            },
            child: ContainerPrimary(
              isDisable: textLenght() < 6,
              child: state is RecoverySecretProgress
                  ? const CircularProgressIndicatorDefault()
                  : Text(
                      "Continuar",
                      textAlign: TextAlign.center,
                      style: Style.whiteStyle,
                    ),
            ),
          ),
        );
      },
    );
  }
}
