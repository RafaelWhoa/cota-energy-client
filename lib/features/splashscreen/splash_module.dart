import 'package:cota_energy_flutter/features/splashscreen/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module{
  @override
  void binds(i){

  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const SplashPage());
  }
}