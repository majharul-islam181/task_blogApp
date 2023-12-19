import 'dart:convert';
import 'dart:developer';

import 'package:blog_app/costom_widgets/costom_textfield.dart';
import 'package:blog_app/models/response/login_response.dart';
import 'package:blog_app/screens/bloglist_screen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void getLogin(String email, String password) async {
    try {
      Response response = await post(
          Uri.parse('https://apitest.smartsoft-bd.com/api/login'),
          body: {
            'email': email,
            'password': password,
          });

      if (response.statusCode == 200) {
        Map<String, dynamic> successData = jsonDecode(response.body);

        SuccessModel successModel = SuccessModel.fromJson(successData);
        log(successModel.data!.token.toString());

        if (successModel.data!.token != null) {
          if (!mounted) return;
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlogListScreen(
                    token: successModel.data!.token.toString(),
                  )));
        }
      }
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text('Smart Software Limited.'),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('animation/3.json', height: 350),
                CustomTextField(
                  labelText: "Enter your email",
                  textEditingController: _emailController,
                ),
                CustomTextField(
                  labelText: "Enter your password",
                  textEditingController: _passwordController,
                ),
                ElevatedButton(
                    onPressed: () {
                      log('successfully login');
                      getLogin(_emailController.text, _passwordController.text);
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
