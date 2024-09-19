import 'package:flutter_dev_test/modules/auth_module/auth_module.dart';
import 'package:flutter_dev_test/modules/shared/shared_mdoule.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/app_service.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(AppService.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: AuthModule());
    super.routes(r);
  }

  @override
  List<Module> get imports => [SharedModule()];
}
