// ignore_for_file: library_private_types_in_public_api, avoid_print, use_build_context_synchronously

import 'package:cupid_knot/viewmodel/signup_viewmodel.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import 'homeScreen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Widget _screenBuilder(SignUpViewModel model, BuildContext context) {
    return Scaffold(
      key: model.scaffoldKey,
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
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomeScreen();
              } else {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form(
                        key: model.formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 30, 10, 10),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: Text(
                                    'Create an account',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Full Name',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: TextFormField(
                                    controller: model.name,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your name',
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                      icon: const Icon(Icons.person),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: TextFormField(
                                    controller: model.email,
                                    obscureText: false,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (email) => (email != null &&
                                            !EmailValidator.validate(email))
                                        ? 'Enter a valid email'
                                        : null,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your email',
                                      icon: const Icon(Icons.email),
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Phone Number',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: TextFormField(
                                    controller: model.phoneNumber,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (pnum) => (pnum != null &&
                                            pnum.length != 10)
                                        ? 'Enter Valid Number without country code!'
                                        : null,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your phone pnumber',
                                      icon: const Icon(Icons.phone),
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Gender',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RadioListTile(
                                        title: const Text("Male"),
                                        value: "Male",
                                        groupValue: model.gender!.text,
                                        onChanged: (value) {
                                          setState(() {
                                            model.gender!.text =
                                                value.toString();
                                          });
                                        },
                                      ),
                                      RadioListTile(
                                        title: const Text("Female"),
                                        value: "Female",
                                        groupValue: model.gender!.text,
                                        onChanged: (value) {
                                          setState(() {
                                            model.gender!.text =
                                                value.toString();
                                          });
                                        },
                                      ),
                                      /* RadioListTile(
                                        title: const Text("Other"),
                                        value: "Other",
                                        groupValue: model.gender!.text,
                                        onChanged: (value) {
                                          setState(() {
                                            model.gender!.text =
                                                value.toString();
                                          });
                                        },
                                      ) */
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Date of Birth',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: TextField(
                                    controller: model.dateinput,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      icon: const Icon(Icons.calendar_today),
                                      labelText: model.birthDateInString,
                                    ),
                                    readOnly: true,
                                    onTap: () async =>
                                        model.selectDate(context),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: TextFormField(
                                    controller: model.password,
                                    obscureText: model.passwordVisibility,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) =>
                                        (value != null && value.length < 6)
                                            ? 'Enter min. 6 characters'
                                            : null,
                                    decoration: InputDecoration(
                                      hintText: 'Please Enter Your Password',
                                      icon: const Icon(Icons.password),
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Poppins',
                                        // color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            model.passwordVisibility =
                                                !model.passwordVisibility;
                                          });
                                        },
                                        child: Icon(
                                          !model.passwordVisibility
                                              ? FontAwesomeIcons.eye
                                              : FontAwesomeIcons.eyeSlash,
                                          color: const Color(0xFF757575),
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Confirm Password',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: TextFormField(
                                    controller: model.cpassword,
                                    obscureText: model.cpasswordVisibility,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) => (value !=
                                            model.password!.text)
                                        ? 'Please enter same password as above'
                                        : null,
                                    decoration: InputDecoration(
                                      hintText: 'Please Re-Enter Your Password',
                                      icon: const Icon(Icons.password),
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            model.cpasswordVisibility =
                                                !model.cpasswordVisibility;
                                          });
                                        },
                                        child: Icon(
                                          !model.cpasswordVisibility
                                              ? FontAwesomeIcons.eye
                                              : FontAwesomeIcons.eyeSlash,
                                          color: const Color(0xFF757575),
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: model.checkBoxValue,
                                  onChanged: ((value) {
                                    setState(() {
                                      model.checkBoxValue = value;
                                    });
                                  }),
                                  activeColor: Colors.grey.shade300,
                                  checkColor: Colors.black,
                                ),
                                const Text(
                                  'Remember Me',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 20, 10, 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    model.signUp(context);
                                    model.createUser();
                                    model.email!.clear();
                                    model.password!.clear();
                                    model.name!.clear();
                                    model.phoneNumber!.clear();
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: ((context) => const LoginScreen()),
                            ),
                          );
                          FocusScope.of(context).unfocus();
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 70, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'Allready have an account ? ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                ' Login',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Builder(builder: (context) {
        return _screenBuilder(model, context);
      }),
    );
  }
}
