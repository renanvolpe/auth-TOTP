import 'package:flutter_dev_test/modules/home_module/presenter/screen/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    super.routes(r);
  }
}
