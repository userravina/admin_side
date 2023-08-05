import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/ecommerce_model.dart';

class FirebaseHelper{
  static final FirebaseHelper firehelper = FirebaseHelper._();

  FirebaseHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //================================ authetiction ========================

  Future<String> geustanonymons() async {
    try {
      await auth.signInAnonymously();
      return "Success";
    } catch (e) {
      return "$e";
    }
  }

  Future<String> createaccount(email,password)
  async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    }
    catch(e)
    {
      return "$e";
    }
  }

  Future<String> loginemailpassword(email,password)
  async {
    try{
      await auth.signInWithEmailAndPassword(email: email,password: password);
      return "Success";
    }
    catch(e)
    {
      return "$e";
    }
  }

  bool checkuser()
  {
    User? user = auth.currentUser;
    return user!=null;
  }

  Future<UserCredential> googleLogin()
  async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  // ignore: non_constant_identifier_names
  Future<void> user_logout()
  async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

  Map<String, String?> readUser()
  {
    User? user = auth.currentUser;
    return {
      'email':user!.email,
      'name':user.displayName,
      'photo':user.photoURL,
    };
  }

  //======================= firestore database =========================

  void inserData(Model_ecommerce model) {
    firestore.collection("product").add({
      "Name": model.Name,
      "decount": model.decount,
      "Price": model.Price,
      "Category": model.cate,
      "Image": model.Img,
      "description": model.desc,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readfirestore() {
    return firestore.collection("product").snapshots();
  }

  Future<void> deleteData(id) {
    return firestore.collection("product").doc(id).delete();
  }

  Future<void> updatedata(Model_ecommerce model) {
    return firestore.collection("product").doc(model.id).set({
      "Name": model.Name,
      "Price": model.Price,
      "decount": model.decount,
      "Category": model.cate,
      "Image": model.Img,
      "description": model.desc,
    });
  }

}