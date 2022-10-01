// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../model/UserData.dart';
import '../model/utils.dart';

class SignUpViewModel extends BaseViewModel {
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? cpassword;
  TextEditingController? name;
  TextEditingController? phoneNumber;
  TextEditingController? dateinput;
  TextEditingController? gender;
  String birthDateInString = "Enter Date";
  DateTime? pickedDate;

  bool passwordVisibility = true;
  bool cpasswordVisibility = true;
  bool? checkBoxValue = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  var dio = Dio();
  String token = 'null';

  Future<void> init() async {
    email = TextEditingController();
    password = TextEditingController();
    cpassword = TextEditingController();
    name = TextEditingController();
    phoneNumber = TextEditingController();
    dateinput = TextEditingController();
    gender = TextEditingController();
    passwordVisibility = true;
    cpasswordVisibility = true;
  }

  Future signUp(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!.text.trim(),
        password: password!.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    Navigator.pop(context);

    /* final response = await dio.post(
      "http://flutter-intern.cupidknot.com/api/register",
      data: {
        "full_name": name!.text,
        'email': email!.text,
        "mobile_no": phoneNumber!.text,
        "password": password!.text,
        "c_password": password!.text,
        "gender": "Practical Test",
        "dob": "2022-05-05",
      },
    );
    token = response.data['token];
    print(response.data); 
    
    */
  }

  Future createUser() async {
    final docUser = FirebaseFirestore.instance.collection('user').doc();

    final user = UserData(
      email: email!.text,
      fullName: name!.text,
      phoneNumber: phoneNumber!.text,
      token: token,
      docId: docUser.id,
      gender: gender!.text,
    );

    final json = user.toJson();
    await docUser.set(json);
  }

  Future<void> selectDate(BuildContext context) async {
    pickedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: pickedDate!,
        firstDate: DateTime(1950),
        lastDate: DateTime(2101));

    if (picked != null && picked != pickedDate) {
      pickedDate = picked;
      dateinput?.text = DateFormat('yyyy-MM-dd').format(pickedDate!).toString();
    }
  }
}
