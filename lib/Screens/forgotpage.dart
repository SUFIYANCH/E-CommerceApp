import 'package:ecommerceapp/Screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Forgotpage extends StatefulWidget {
  const Forgotpage({super.key});

  @override
  State<Forgotpage> createState() => _ForgotpageState();
}

class _ForgotpageState extends State<Forgotpage> {
  TextEditingController forgotPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF03d47e),
        foregroundColor: const Color(0xFF191a30),
        leading: IconButton(
            onPressed: (() {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: ((context) => const LoginPage())));
            }),
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Forgot Password"),
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: forgotPasswordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF03d47e)),
                  onPressed: (() async {
                    var forgotEmail = forgotPasswordController.text.trim();

                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: forgotEmail)
                          .then((value) => {
                                print("Email sent"),
                                Get.off(() => const LoginPage())
                              });
                    } on FirebaseAuthException catch (e) {
                      print("Error $e");
                    }
                  }),
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(
                        color: Color(0xFF191a30),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
