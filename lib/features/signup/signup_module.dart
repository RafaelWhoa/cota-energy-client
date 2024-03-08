

import 'package:cota_energy_flutter/features/signup/signup_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignupModule extends Module {
  static String route = '/signup/';
  static String routeRaiz = '/start/signup/';

  @override
  void binds(i){

  }

  @override
  void routes(r){
    r.child(Modular.initialRoute, child: (context) => const SignupPage());
  }
}