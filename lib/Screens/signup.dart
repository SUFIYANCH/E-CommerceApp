import 'dart:developer';
import 'package:ecommerceapp/Screens/login.dart';
import 'package:ecommerceapp/colors/colors.dart';
import 'package:ecommerceapp/services/signup_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phonenumberController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;

  void vaildation() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('yes');
    } else {
      print('no');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: userNameController,
                    validator: (value) {
                      if (value == '') {
                        return 'Please Fill User';
                      } else if (value!.length < 6) {
                        return 'UserName is too short';
                      }
                      return '';
                    },
                    decoration: const InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == '') {
                        return 'Please fill the email';
                      } else if (!regExp.hasMatch(value!)) {
                        return 'Email Is Invalid';
                      }
                      return '';
                    },
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: obserText,
                    validator: (value) {
                      if (value == '') {
                        return 'Please Fill Password';
                      } else if (value!.length < 8) {
                        return 'Password Is Too Short';
                      }
                      return '';
                    },
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obserText = !obserText;
                            });
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(
                            obserText == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        hintStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder()),
                  ),
                  TextFormField(
                    controller: phonenumberController,
                    validator: (value) {
                      if (value == '') {
                        return 'Please Fill The Phone Number';
                      } else if (value!.length < 10) {
                        return 'Phone Number should be 10';
                      }
                      return '';
                    },
                    decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor),
                        onPressed: (() async {
                          var userName = userNameController.text.trim();
                          var userEmail = emailController.text.trim();

                          var userPassword = passwordController.text.trim();

                          var userPhone = phonenumberController.text.trim();

                          vaildation();
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: userEmail, password: userPassword)
                              .then((value) => {
                                    log("user created"),
                                    signupUser(userName, userPhone, userEmail,
                                        userPassword)
                                  });
                        }),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF191a30)),
                        )),
                  ),
                  Row(
                    children: [
                      const Text("I don't have an account!!"),
                      const SizedBox(
                        width: 14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
