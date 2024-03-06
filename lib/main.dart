import 'package:cota_energy_flutter/app_widget.dart';
import 'package:cota_energy_flutter/features/home/home_page.dart';
import 'package:cota_energy_flutter/features/login/login_page.dart';
import 'package:cota_energy_flutter/features/splashscreen/splash_module.dart';
import 'package:cota_energy_flutter/features/start/start_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'app_module.dart';

void main() async {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
  await _initHive();
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  final hiveBoxes = [
    "token",
  ];

  final hiveFutures = hiveBoxes.map(Hive.openBox).toList();
  await Future.wait(hiveFutures);
}
