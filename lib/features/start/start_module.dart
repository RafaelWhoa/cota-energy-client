import 'package:cota_energy_flutter/features/home/home_module.dart';
import 'package:cota_energy_flutter/features/login/login_module.dart';
import 'package:cota_energy_flutter/features/signup/signup_module.dart';
import 'package:cota_energy_flutter/features/start/start_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartModule extends Module {
  static String route = '/start/';

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const StartPage(), children: [
      ModuleRoute(LoginModule.route,
          module: LoginModule(), transition: TransitionType.downToUp),
      ModuleRoute(SignupModule.route,
          module: SignupModule(), transition: TransitionType.downToUp),
      ModuleRoute(HomeModule.route,
          module: HomeModule(), transition: TransitionType.downToUp),
    ]);
  }
}
