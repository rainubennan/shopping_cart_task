import 'package:flutter/material.dart';

import 'product_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                  child: Image(
                      image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPP2deninRHbJNIM4wIHeAfjoBaepL4Rc8oQ&usqp=CAU',
              ))),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                //we can use validator property
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    label: Text("Username"),
                    hintText: "Username must be your email address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                    )),
                validator: (text) {
                  if (text!.isEmpty || !(text.contains('@')) || text == null) {
                    return 'Enter a valid email';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
                validator: (password) {
                  if (password == null ||
                      password.length < 6 ||
                      password.isEmpty) {
                    return 'Password  length should greater than 6/ should not be null';
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.done,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent),
                  onPressed: () {
                    final valid = formkey.currentState!.validate();
                    if (valid) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductGrid()));
                    } else {
                      AlertDialog(
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Try again'))
                        ],
                        title: Text('Login Failed'),
                        content: Text('You must entered wrong credentials'),
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
