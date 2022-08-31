import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:capstoe_frontend/providers/auth_provider.dart';

import '../models/user.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Sign In"),
            TextField(
              decoration: const InputDecoration(hintText: 'Username'),
              controller: usernameController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              controller: passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                var isSuccess = await context.read<AuthProvider>().signin(
                    username: usernameController.text,
                    password: passwordController.text);

                if (isSuccess) {
                  context.pop();
                }
              },
              child: const Text("Sign In"),
            )
          ],
        ),
      ),
    );
  }
}