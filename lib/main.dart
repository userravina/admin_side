import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

import 'Addmen_side/Productscreen.dart';
import 'Addmen_side/Sign_inscreen.dart';
import 'Addmen_side/Splash.dart';
import 'Addmen_side/TabScreen.dart';
import 'Addmen_side/updateScreen.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splach',
        routes: {
          // ================================= edmin side ===============================
          'splach':(p0) => splachscreen(),
          'sign': (p0) => Sign_in(),
          'eHome':(p0) => edmenHome(),
          'product':(p0) => ProductScreen(),
          'update':(p0) => update_Screen(),
        },
      ),
    ),
  );
}
