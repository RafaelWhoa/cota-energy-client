import 'dart:convert';
import 'dart:io';

import 'package:cota_energy_flutter/commons/utils/validators_utils.dart';
import 'package:cota_energy_flutter/features/home/home_module.dart';
import 'package:cota_energy_flutter/features/signup/signup_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
const String apiIP = 'localhost:8080';
final _formKey = GlobalKey<FormState>();

Future<String?> _login(String email, String password) async {
  var res = await http.post(Uri.http(apiIP, "/auth/login"),
      body: json.encode({"email": email, "password": password}),
      headers: {
        "accept": "application/json",
        "content-type": "application/json"
      });
  return res.body;
}

void displayDialog(context, text) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red.shade400,
    ));

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    _isLoginDisabled = false;
    _isEmailValid = true;
  }

  void _toggleLoginButton() {
    setState(() {
      _isLoginDisabled = !_isLoginDisabled;
    });
  }

  late bool _isLoginDisabled;
  late bool _isEmailValid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "COTA Energy",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Welcome!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      if (!ValidatorsUtils.emailValidator(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'E-mail',
                    ))),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Password',
                    ))),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password",
                      style: TextStyle(color: Colors.grey.shade700),
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        _isLoginDisabled ? Colors.grey : Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: _isLoginDisabled
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            _toggleLoginButton();
                            var email = _emailController.text;
                            var password = _passwordController.text;
                            var loginRes = await _login(email, password);
                            var loginResJson = json.decode(loginRes!);
                            if (loginResJson.containsKey("token")) {
                              var box = await Hive.openBox("tokenBox");
                              _toggleLoginButton();
                              box.put("token", loginResJson["token"]);
                              debugPrint("Token: ${box.get("token")}");
                              _navigate(HomeModule.routeRaiz, HomeModule.route);
                            } else {
                              _toggleLoginButton();
                              displayDialog(context, loginResJson["message"]);
                            }
                          }
                        },
                  child: _isLoginDisabled
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 200,
              child: TextButton(
                onPressed: () {
                  _navigate(SignupModule.routeRaiz, SignupModule.route);
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  void _navigate(String route, String routeName) {
    if (!Modular.to.path.contains(routeName)) {
      Modular.to.pushNamed(route);
    }
  }
}
