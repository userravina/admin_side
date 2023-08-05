
import 'package:get/get.dart';

import '../model/ecommerce_model.dart';

class ecommerce_controller extends GetxController{

  List<Model_ecommerce> ProductList = [];
  List<Model_ecommerce> list1 = [];
  List<Model_ecommerce> SearchList = [];


  RxInt i = 0.obs;
  RxBool isPressed=false.obs;
  RxInt number = 0.obs;
  List<Model_ecommerce> cartList=[];
  List favoritelist = [];
  List<Model_ecommerce> flist = [];
  void changefevorit(index)
  {
    index = isPressed.value = true;
    update();
  }

  void change(int index) {
    i.value = index;
    update();
  }



}