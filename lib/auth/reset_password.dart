
import 'package:flutter/material.dart';
import 'package:veebank/auth/login.dart';
import 'package:veebank/utilities/custom_flat_button.dart';
import 'package:veebank/utilities/services.dart';

class ResetPassword extends StatefulWidget {
  static const String id = 'reset-password';

  const ResetPassword({Key? key}) : super(key: key);
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _phoneTextController = TextEditingController();
  String? phoneNumber;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    Services services = Services();
    // final _authData = Provider.of<AuthProvider>(context);

    return Scaffold(
        appBar: services.simpleAppBar(title: "Reset Password", context: context),
        body: Form(
          key: _formKey,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    services.logo(45, null),
                    services.sizedBox(h: 20),
                    const Text('Recover your password', style: TextStyle(fontFamily: 'Anton', fontSize: 20)),
                  ],
                ),
                services.sizedBox(h: 20),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(text: 'Forgot Password? ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  TextSpan(
                      text: 'Don\'t worry, just provide your phone number, we\'ll help you recovery your account!',
                      style: TextStyle(color: Colors.black87)),
                ])),
                services.sizedBox(h: 20),
                TextFormField(
                    controller: _phoneTextController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }

                      setState(() {
                        phoneNumber = value;
                      });
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      prefixIcon: const Icon(Icons.phone_android),
                      labelStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                      ),
                      focusColor: Theme.of(context).primaryColor,
                    )),
                services.sizedBox(h: 2),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 35),
                  child: CustomFlatButton(
                    label: "Reset Password",
                    labelStyle: const TextStyle(fontSize: 20),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _loading = true;
                        });
                        // Scaffold.of(context).showSnackBar(SnackBar(
                        //     content: Text(
                        //         'Please check your phone number ${_phoneTextController.text} for password reset instructions')));
                      }
                      Navigator.pushReplacementNamed(context, LoginScreen.id);
                    },
                    borderRadius: 30,
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
