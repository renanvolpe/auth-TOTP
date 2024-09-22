import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/modules/core/style/app_color.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/text_style.dart';
import '../bloc/login/login_bloc.dart';
import '../widget/btn_do_login.dart';
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
                      BtnDoLogin(
                        usesrnameTextController: usesrnameTextController,
                        passwordTextController: passwordTextController,
                      )
                    ],
                  ),
                ),
              ],
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
