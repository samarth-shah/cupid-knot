// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../model/ContactList.dart';

class UserViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final curUser = FirebaseAuth.instance.currentUser!;

  Future createContactUser(BuildContext context) async {
    FocusScope.of(context).unfocus();
    await createContact();
    email.clear();
    phoneNumber.clear();
    fullName.clear();
    Navigator.pop(context);
  }

  Future createContact() async {
    final docUser = FirebaseFirestore.instance.collection('contactList').doc();

    final user = ContactList(
      email: email.text,
      fullName: fullName.text,
      phoneNumber: phoneNumber.text,
      owner: curUser.email!,
      docId: docUser.id,
    );

    final json = user.toJson();
    await docUser.set(json);
  }
}
