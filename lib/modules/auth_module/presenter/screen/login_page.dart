import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/modules/app_service.dart';
import 'package:flutter_dev_test/modules/auth_module/presenter/widget/circular_progress_indicator_default.dart';
import 'package:flutter_dev_test/modules/core/style/app_color.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/text_style.dart';
import '../../data/param/login_param.dart';
import '../bloc/login/login_bloc.dart';
import '../widget/container_primary.dart';
import '../widget/input_decoration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController usesrnameTextController;
  late TextEditingController passwordTextController;

  late LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = Modular.get<LoginBloc>();

    usesrnameTextController = TextEditingController(text: kDebugMode ? "admin" : "");
    passwordTextController = TextEditingController(text: kDebugMode ? "password123" : "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.kWhite,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              // padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Gap(100),
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      child: Stack(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 150),
                                child: Image.asset("assets/vector1.png"),
                              )),
                          Align(alignment: Alignment.centerLeft, child: Image.asset("assets/vector2.png")),
                          Align(alignment: Alignment.center, child: Image.asset("assets/login-image.png")),
                        ],
                      )),
                  const Gap(30),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: usesrnameTextController,
                          decoration: inputDecorationDefault("E-mail"),
                        ),
                        const Gap(10),
                        TextField(
                          controller: passwordTextController,
                          decoration: inputDecorationDefault("Senha"),
                        ),
                        const Gap(20),
                        BlocConsumer<LoginBloc, LoginState>(
                          bloc: loginBloc,
                          listener: (context, state) {
                            if (state is LoginFailureTotp) {
                              if (state.message.contains("Invalid TOTP code")) {
                                const snackBar = SnackBar(
                                  content: Text('Informe o código totp para continuar'),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                var param = LoginParam(
                                    username: usesrnameTextController.text,
                                    password: passwordTextController.text,
                                    totp_code: '');

                                Modular.to.pushNamed("recovery-secret", arguments: param);
                              } else if (state is LoginFailure) {
                                const snackBar = SnackBar(
                                  content: Text('Informe credenciais válidas para continuar'),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
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

                                      var param =
                                          LoginParam(username: "admin", password: "password123", totp_code: totpCode);
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
                        )
                      ],
                    ),
                  ),
                  // const Gap(130),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Esqueci a senha",
                  style: Style.primaryStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
