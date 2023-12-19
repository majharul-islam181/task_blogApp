

import 'dart:developer';

import 'package:blog_app/costom_widgets/costom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Login page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              labelText: "Enter your email",
              textEditingController: _emailController,
            ),
            CustomTextField(
              labelText: "Enter your password",
              textEditingController: _passwordController,
            ),
            GestureDetector(
              onTap: () {
                log('tapped');
                // handle on tap here
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 99, 237, 68),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(10),
                child: Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
