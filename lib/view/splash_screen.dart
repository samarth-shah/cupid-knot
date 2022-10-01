// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cupid_knot/viewmodel/splashScreen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewmodel>.reactive(
      viewModelBuilder: () => SplashScreenViewmodel(),
      onModelReady: (model) => model.handleStartup(context),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow.shade600,
            automaticallyImplyLeading: false,
            title: const Text(
              'Cupid Knot',
              style: TextStyle(
                color: Colors.blue,
                fontFamily: 'Poppins',
                fontSize: 22,
              ),
            ),
            elevation: 2,
          ),
          backgroundColor: const Color(0xFFFFCB12),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-0.05, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                    child: Image.asset(
                      'assets/splashScreen.png',
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/splashScreen1.png',
                  width: 350,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
