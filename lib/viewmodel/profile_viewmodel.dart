import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../model/UserData.dart';

class ProfileViewModel extends BaseViewModel {
  final curUser = FirebaseAuth.instance.currentUser!;
  final formKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController gender = TextEditingController();

  UserData users;
  
  ProfileViewModel({
    required this.users,
  });

  Future<void> init() async {
    editValues(users);
  }

  Future editValues(UserData users) async {
    fullName.text = users.fullName;
    phoneNumber.text = users.phoneNumber;
  }

  Future editUser(BuildContext context) async {
    FirebaseFirestore.instance.collection('user').doc(users.docId).update(
      {
        'fullName': fullName.text,
        'phoneNumber': phoneNumber.text,
      },
    );
    Navigator.pop(context);
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
