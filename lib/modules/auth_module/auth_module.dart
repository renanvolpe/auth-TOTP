import 'package:flutter_dev_test/modules/auth_module/presenter/screen/login_page.dart';
import 'package:flutter_dev_test/modules/auth_module/presenter/screen/recovery_secret_page.dart';
import 'package:flutter_dev_test/modules/home_module/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const LoginPage());
    r.child('/recovery-secret', child: (_) => const RecoverySecretPage());
    r.module('/home', module: HomeModule());
    super.routes(r);
  }
}
