import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'dio/dio_service.dart';

class SharedModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(() => Dio());
    i.addSingleton<DioService>(DioClient.new);



    super.exportedBinds(i);
  }
}
