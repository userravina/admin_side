
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../utils/firebase.dart';
import '../controller/ecommerce_controller.dart';
import '../model/ecommerce_model.dart';

// ignore: camel_case_types
class update_Screen extends StatefulWidget {
  const update_Screen({super.key});

  @override
  State<update_Screen> createState() => _update_ScreenState();
}

// ignore: camel_case_types
class _update_ScreenState extends State<update_Screen> {
  ecommerce_controller controller = Get.put(ecommerce_controller());

  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtCate = TextEditingController();
  TextEditingController txtImage = TextEditingController();
  TextEditingController txtDesc = TextEditingController();
  TextEditingController txtdescount = TextEditingController();
  String? id;

  @override
  void initState() {
    Model_ecommerce model = Get.arguments;
    id = model.id;
    txtName = TextEditingController(text: model.Name);
    txtCate = TextEditingController(text: model.cate);
    txtImage = TextEditingController(text: model.Img);
    txtDesc = TextEditingController(text: model.desc);
    txtPrice = TextEditingController(text: model.Price);
    txtdescount = TextEditingController(text: model.decount);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Update Product",
                            style: GoogleFonts.acme(
                                fontSize: 20,
                                letterSpacing: 1,
                                color: Colors.black38),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildTextField(controller: txtName, hint: "Name"),
                      const SizedBox(
                        height: 20,
                      ),
                      buildTextField(controller: txtPrice, hint: "Price"),
                      const SizedBox(
                        height: 20,
                      ),
                      buildTextField(controller: txtCate, hint: "category"),
                      const SizedBox(
                        height: 20,
                      ),
                      buildTextField(controller: txtdescount, hint: "desc"),
                      const SizedBox(
                        height: 20,
                      ),
                      buildTextField(controller: txtImage, hint: "Image"),
                      const SizedBox(
                        height: 20,
                      ),
                      buildTextField(controller: txtDesc, hint: "description"),
                      const SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () {
                          Model_ecommerce model = Model_ecommerce(
                              cate: txtCate.text,
                              id: id,
                              Img: txtImage.text,
                              desc: txtDesc.text,
                              Name: txtName.text,
                              decount: txtdescount.text,
                              Price: txtPrice.text);
                          FirebaseHelper.firehelper.updatedata(model);
                          txtName.clear();
                          txtCate.clear();
                          txtDesc.clear();
                          txtPrice.clear();
                          txtImage.clear();

                          Get.back();
                        },
                        child: Container(
                          height: 5.5.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff07635d),
                          ),
                          child: Center(
                            child: Text(
                              "Update",
                              style: GoogleFonts.alef(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField({required hint, required controller}) {
    return TextField(
      controller: controller,
      cursorColor: Colors.deepOrange.shade200,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.deepOrange.shade200,
            ),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.deepOrange.shade200,
            ),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.deepOrange.shade200,
            ),
            borderRadius: BorderRadius.circular(20)),
        labelText: "$hint",
        labelStyle: GoogleFonts.actor(color: Colors.black),
      ),
    );
  }
}
