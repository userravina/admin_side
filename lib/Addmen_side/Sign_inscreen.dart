
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../utils/firebase.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({super.key});

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {

  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 38.h,
              width: 100.w,
              decoration: const BoxDecoration(
                // color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage("assets/images/Group 1.png"),
                    fit: BoxFit.contain),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 100),
              child: Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 140),
              child: Text(
                "Back",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                    child: TextField(
                      controller: txtemail,
                      decoration: const InputDecoration(labelText: "Email"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                    child: TextField(
                      obscureText: true,
                      controller: txtpassword,
                      decoration: const InputDecoration(labelText: "Password"),
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 30),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  InkWell(
                    onTap: () async {
                      var email = txtemail.text;
                      var password = txtpassword.text;

                      var msg = await FirebaseHelper.firehelper.loginemailpassword(email, password);
                      if(msg == "Success")
                      {
                        Get.offNamed('eHome');
                      }
                      Get.snackbar(msg, 'login Success',colorText: Colors.black);
                    },
                    child: Container(
                      height: 7.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          color: const Color(0xff07635d),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
