import 'dart:async';

import 'package:cota_energy_flutter/features/login/login_module.dart';
import 'package:cota_energy_flutter/features/start/start_module.dart';
import 'package:cota_energy_flutter/features/start/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _SplashPageState() {
    Timer(const Duration(milliseconds: 1500), () {
      Modular.to.pushNamed(LoginModule.routeRaiz);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("COTA energy"),
            Text("Splash Page")
          ],
        )
      ),
    );
  }
}
