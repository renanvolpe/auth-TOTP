import 'package:flutter_modular/flutter_modular.dart';

import 'modules/app_service.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(AppService.new);
    super.binds(i);
  }
}
