import 'package:flutter/material.dart';
import 'package:veebank/auth/login.dart';
import 'package:veebank/auth/registeration_form.dart';
import 'package:veebank/utilities/services.dart';

class Signup extends StatefulWidget {
  static const String id = 'sign_up-screen';

  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    Services services = Services();
    return SafeArea(
      child: Scaffold(
        appBar: services.simpleAppBar(title: "Create a VeeBank Account", context: context),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                services.logo(45, null),
                const RegisterForm(),
                services.sizedBox(h: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: RichText(
                        text: const TextSpan(text: '', children: [
                          TextSpan(text: 'Already have an account? ', style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                        ]),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
