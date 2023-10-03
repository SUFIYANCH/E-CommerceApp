import 'package:ecommerceapp/Screens/forgotpage.dart';
import 'package:ecommerceapp/Screens/homepage.dart';
import 'package:ecommerceapp/Screens/signup.dart';
import 'package:ecommerceapp/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// String p =
//     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

// RegExp regExp = new RegExp(p);
bool obserText = true;

class _LoginPageState extends State<LoginPage> {
  void vaildation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print('yes');
    } else {
      print('no');
    }
  }

  TextEditingController loginEmailController = TextEditingController();

  TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: loginEmailController,
                      validator: ((value) {
                        if (value == '') {
                          return 'Please Fill the email';
                        } else if (!regExp.hasMatch(value!)) {
                          return 'Email Is Invalid';
                        }
                        return '';
                      }),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    TextFormField(
                      controller: loginPasswordController,
                      obscureText: obserText,
                      validator: (value) {
                        if (value == '') {
                          return 'Please fill password';
                        } else if (value!.length < 8) {
                          return 'Password is too short';
                        }
                        return '';
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.black),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obserText = !obserText;
                              });
                            },
                            child: Icon(
                              obserText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor),
                          onPressed: (() async {
                            var loginEmail = loginEmailController.text.trim();
                            var loginPassword =
                                loginPasswordController.text.trim();
                            try {
                              final User? firebaseUser = (await FirebaseAuth
                                      .instance
                                      .signInWithEmailAndPassword(
                                          email: loginEmail,
                                          password: loginPassword))
                                  .user;
                              if (firebaseUser != null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              } else {
                                print("Check Email & Password");
                              }
                            } on FirebaseAuthException catch (e) {
                              print("Error $e");
                            }
                            vaildation();
                          }),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF191a30)),
                          )),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 213, 207, 207)),
                        onPressed: (() {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => Forgotpage())));
                        }),
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.black),
                        )),
                    Row(
                      children: [
                        Text("I don't have an account!!"),
                        SizedBox(
                          width: 14,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text(
                            'SignUp',
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
        ),
      ),
    );
  }
}
