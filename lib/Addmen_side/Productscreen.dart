
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../model/ecommerce_model.dart';
import '../../utils/firebase.dart';
import '../controller/ecommerce_controller.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ecommerce_controller controller = Get.put(ecommerce_controller());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                QuerySnapshot qs = snapshot.data!;
                List qsList = qs!.docs;
                // ignore: non_constant_identifier_names
                controller.ProductList = [];
                for (var x in qsList) {
                  Map? data = x.data() as Map;
                  String? id = x.id;
                  String? name = data['Name'];
                  String? descount = data['decount'];
                  String? desc = data['description'];
                  String? cate = data['Category'];
                  String? price = data['Price'];
                  String? img = data['Image'];

                  Model_ecommerce t1 = Model_ecommerce(
                      Price: price,
                      Name: name,
                      desc: desc,
                      Img: img,
                      decount: descount,
                      cate: cate,
                      id: id);

                  controller.ProductList.add(t1);
                }
                return GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 36.h),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 33.5.h,
                              width: 48.w,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade300),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10,),
                                  Container(
                                    height: 21.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius:
                                      BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // ignore: sized_box_for_whitespace
                                        Container(
                                          height: 120,
                                          width: 110,
                                          child: Image.network(
                                            "${controller.ProductList[index].Img}",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "${controller.ProductList[index].Name}",
                                        style:
                                        GoogleFonts.mada(fontSize: 15),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "${controller.ProductList[index].cate}",
                                        style:
                                        GoogleFonts.mada(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 50),
                                          child: Text(
                                            "₹${controller.ProductList[index].Price}",
                                            style:
                                            GoogleFonts.mada(fontSize: 15),
                                          ),
                                        ),

                                        // PopupMenuButton(
                                        //   itemBuilder:
                                        //       (BuildContext bc) {
                                        //     return [
                                        //       PopupMenuItem(
                                        //         child: Text("update"),
                                        //         onTap: () => Get.toNamed(
                                        //             'update',
                                        //             arguments:
                                        //                 ProductList[
                                        //                     index]),
                                        //       ),
                                        //       PopupMenuItem(
                                        //         child: Text("Delete"),
                                        //         onTap: () {
                                        //           FirebaseHelper
                                        //               .firehelper
                                        //               .deleteData(
                                        //                   '${ProductList[index].id}');
                                        //         },
                                        //       ),
                                        //     ];
                                        //   },
                                        // ),
                                        InkWell(
                                            onTap: () {
                                              Get.toNamed('update',
                                                  arguments: controller
                                                      .ProductList[
                                                  index]);
                                            },
                                            child: const Icon(
                                              Icons.edit,
                                              color: Colors.grey,
                                            )),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              FirebaseHelper
                                                  .firehelper
                                                  .deleteData(
                                                  '${controller.ProductList[index].id}');
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors
                                                  .redAccent.shade100,
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ]),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                ],
                              ),

                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: controller.ProductList.length);
              }
              return Center(
                child: const CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
            },
            stream: FirebaseHelper.firehelper.readfirestore(),
          ),
        ),
      ],
    );
  }
}
