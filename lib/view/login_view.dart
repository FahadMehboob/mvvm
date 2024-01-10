import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view/home_screen.dart';

import '../res/components/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _obsecurePassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            focusNode: emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email",
              labelText: "Email",
              prefixIcon: Icon(Icons.alternate_email),
            ),
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(
                  context, emailFocusNode, passwordFocusNode);
            },
          ),
          ValueListenableBuilder(
            valueListenable: _obsecurePassword,
            builder: (context, value, child) {
              return TextFormField(
                focusNode: passwordFocusNode,
                controller: _passwordController,
                obscureText: _obsecurePassword.value,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock_open_rounded),
                  suffixIcon: InkWell(
                    onTap: () {
                      _obsecurePassword.value = !_obsecurePassword.value;
                    },
                    child: Icon(_obsecurePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: height * .085,
          ),
          RoundButton(
            title: "Login",
            onPress: () {
              if (_emailController.text.isEmpty) {
                Utils.FlushBarErrorMessage("Please Enter Email", context);
              } else if (_passwordController.text.isEmpty) {
                Utils.FlushBarErrorMessage("Please Enter Password", context);
              } else if (_passwordController.text.length < 6) {
                Utils.FlushBarErrorMessage(
                    "Please Enter 6 digit Password", context);
              } else {
                Utils.FlushBarSuccessMessage("Login Successfully", context);
              }
            },
          ),
        ],
      ),
    );
  }
}
