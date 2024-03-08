import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commons/utils/validators_utils.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    super.initState();
    _isSignupDisabled = false;
  }

  void _toggleSignupButton() {
    setState(() {
      _isSignupDisabled = !_isSignupDisabled;
    });
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late bool _isSignupDisabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "Signup Page",
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
      const SizedBox(
        height: 110,
      ),
      Form(
        key: _formKey,
          child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: TextFormField(
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please enter email';
                }
                if (!ValidatorsUtils.emailValidator(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: 'Enter your email',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: 'Password',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: TextFormField(
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please enter password';
                }
                if(!ValidatorsUtils.comfirmationPasswordValidator(_passwordController.text, _confirmPasswordController.text)){
                  return 'Passwords do not match';
                }
                return null;
              },
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: 'Confirm your password',
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width - 250,
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        _isSignupDisabled ? Colors.grey : Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                    }
                  },
                  child: _isSignupDisabled
                      ? const CircularProgressIndicator()
                      : const Text('Signup', style: TextStyle(color: Colors.white),)))
        ],
      ))
    ])));
  }
}
