import 'package:cota_energy_flutter/features/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module{
  static String route = '/login/';
  static String routeRaiz = '/start/login/';

  @override
  void binds(i){

  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const LoginPage());
  }
}