// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../model/utils.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController? emailTextEditingController;
  TextEditingController? passwordTextEditingController;
  bool passwordVisibility = true;
  bool? checkBoxValue = false;
  var dio = Dio();

  Future<void> init() async {
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
  }

  Future signIn(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
     try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextEditingController!.text.trim(),
        password: passwordTextEditingController!.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    Navigator.pop(context);

    /* final response = await dio.post(
      "http://flutter-intern.cupidknot.com/api/login",
      data: {
        'email': emailTextEditingController!.text,
        'password': passwordTextEditingController!.text,
      },
    );
        print(response.data);
 */
  }
}
