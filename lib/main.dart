import 'package:cota_energy_flutter/app_widget.dart';
import 'package:cota_energy_flutter/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

class AppModule extends Module {
  @override
  void binds(i){

  }

  @override
  void routes(r){
    r.child('/', child: (context) => const HomePage());
  }
}
