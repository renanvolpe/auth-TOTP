import 'package:flutter_dev_test/modules/auth_module/presenter/screen/login_page.dart';
import 'package:flutter_dev_test/modules/auth_module/presenter/screen/recovery_secret_page.dart';
import 'package:flutter_dev_test/modules/home_module/home_module.dart';
import 'package:flutter_dev_test/modules/shared/shared_mdoule.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/abstract_repository/abstract_auth_repository.dart';
import 'data/impl_repository/auth_repository_impl.dart';
import 'data/param/login_param.dart';
import 'presenter/bloc/login/login_bloc.dart';
import 'presenter/bloc/recovery_pass/recovery_secret_bloc.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const LoginPage());
    r.child('/recovery-secret', child: (_) => RecoverySecretPage(loginParam: r.args.data as LoginParam));
    r.module('/home', module: HomeModule());
    super.routes(r);
  }

  @override
  void binds(Injector i) {
    i.addSingleton<IAuthRepository>(AuthRepositoryImpl.new);
    i.addSingleton(RecoverySecretBloc.new);
    i.add(LoginBloc.new);
    super.binds(i);
  }

  @override
  List<Module> get imports => [SharedModule()];
}
