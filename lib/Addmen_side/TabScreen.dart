
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../utils/firebase.dart';
import 'Addscreen.dart';
import 'Productscreen.dart';

// ignore: camel_case_types
class edmenHome extends StatefulWidget {
  const edmenHome({super.key});

  @override
  State<edmenHome> createState() => _edmenHomeState();
}

// ignore: camel_case_types
class _edmenHomeState extends State<edmenHome> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            backgroundColor: Colors.teal.shade800,
            title: Text(
              "ecommerce app",
              style: GoogleFonts.acme(fontSize: 22, color: Colors.white),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text(
                    "Product",
                    style: GoogleFonts.adamina(),
                  ),
                ),
                Tab(
                  child: Text(
                    "Add",
                    style: GoogleFonts.adamina(),
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            // backgroundColor: const Color(0xFF1C2833),
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xff07635d),
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xff07635d),
                    ),
                    accountName: Text(
                      "Ravina Baldaniya",
                      style: TextStyle(fontSize: 18),
                    ),
                    accountEmail: Text("ravina@gmail.com"),
                    currentAccountPictureSize: Size.square(50),
                    currentAccountPicture: Padding(
                      padding: EdgeInsets.only(),
                      child: CircleAvatar(
                        backgroundColor: Colors.deepOrangeAccent,
                        child: Text(
                          "R",
                          style: TextStyle(fontSize: 30.0, color: Colors.black),
                        ), //Text
                      ),
                    ), //circleAvatar
                  ), //UserAccountDrawerHeader
                ), //DrawerHeader
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Color(0xff07635d),
                  ),
                  title: Text(
                    ' My Profile ',
                    style: GoogleFonts.lato(
                      fontSize: 12.sp,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.book,
                    color: Color(0xff07635d),
                  ),
                  title: Text(
                    ' Big Picture ',
                    style: GoogleFonts.lato(
                      fontSize: 12.sp,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.people_alt_rounded,
                    color: Color(0xff07635d),
                  ),
                  title: Text(
                    ' Users ',
                    style: GoogleFonts.lato(
                      fontSize: 12.sp,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.admin_panel_settings,
                    color: Color(0xff07635d),
                  ),
                  title: Text(
                    ' Sava File ',
                    style: GoogleFonts.lato(
                      fontSize: 12.sp,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.edit,
                    color: Color(0xff07635d),
                  ),
                  title: Text(
                    ' Edit Profile Image',
                    style: GoogleFonts.lato(
                      fontSize: 12.sp,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () async {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Color(0xff07635d),
                  ),
                  title: Text(
                    'LogOut',
                    style: GoogleFonts.lato(
                      fontSize: 12.sp,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () async {
                    await FirebaseHelper.firehelper.user_logout();
                    Get.toNamed('sign');
                  },
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ProductScreen(),
              Addscreen()
            ],
          ),
        ),
      ),
    );
  }


}
