import 'package:cota_energy_flutter/features/start/start_module.dart';
import 'package:cota_energy_flutter/features/start/start_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/home/home_page.dart';
import 'features/login/login_page.dart';
import 'features/splashscreen/splash_module.dart';

class AppModule extends Module {
  @override
  void binds(i){
  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module(StartModule.route, module: StartModule());
  }
}