import 'package:cota_energy_flutter/app_widget.dart';
import 'package:cota_energy_flutter/features/home/home_page.dart';
import 'package:cota_energy_flutter/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

class AppModule extends Module {
  @override
  void binds(i){
    Modular.setInitialRoute('/login');
  }

  @override
  void routes(r) {
    r.child('/home', child: (context) => const HomePage());
    r.child('/login', child: (context) => const LoginPage());
  }
}
