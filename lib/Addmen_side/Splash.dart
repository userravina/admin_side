
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/firebase.dart';

// ignore: camel_case_types
class splachscreen extends StatefulWidget {
  const splachscreen({super.key});

  @override
  State<splachscreen> createState() => _splachscreenState();
}

// ignore: camel_case_types
class _splachscreenState extends State<splachscreen> {
  bool login = false;
  @override
  void initState()  {
    login =  FirebaseHelper.firehelper.checkuser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
          () {
        login == false
            ? Get.offAllNamed("sign")
            : Get.offNamed("eHome");
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Image.asset("assets/images/Splash.png"),
            )
          ],
        ),
      ),
    );
  }
}
