import 'package:flutter/material.dart';
import 'package:flutter_auth_bloc/bloc/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/request/login_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController!.dispose();
    passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('Login'),
      // ),
      body: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          Text('Login',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: emailController,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller: passwordController,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
              alignment: Alignment.center,
              child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                if (state is LoginError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Gagal Login: Username atau Password salah'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else if (state is LoginLoaded) {
                  emailController!.clear();
                  passwordController!.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Login Success'),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  Navigator.pushNamed(context, '/home');
                }
              }, builder: (context, state) {
                if (state is LoginLoading) {
                  return const CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () {
                    final requestModel = LoginModel(
                      email: emailController!.text,
                      password: passwordController!.text,
                    );

                    context.read<LoginBloc>().add(SaveLoginEvent(
                          request: requestModel,
                        ));
                  },
                  child: const Text('Login'),
                );
              })
              //
              ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Apakah anda belum punya akun ?',
                  style: Theme.of(context).textTheme.bodySmall),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Register'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
