// ignore_for_file: use_build_context_synchronously

import 'package:cupid_knot/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewmodel extends BaseViewModel {
  void handleStartup(BuildContext context) async {
    FocusScope.of(context).unfocus();
    await Future.delayed(const Duration(milliseconds: 2800));
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}
