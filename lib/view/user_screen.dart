// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_knot/model/contactList.dart';
import 'package:cupid_knot/viewmodel/user_viewmodel.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});
  // int length = 0;

  Widget bottomModal(BuildContext context, UserViewModel model) {
    var size = MediaQuery.of(context).size.height;
    return SizedBox(
      height: size * 3 / 4,
      child: Form(
        key: model.formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  child: Text(
                    'Contact Form',
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
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: model.fullName,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Enter your full name',
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
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: model.email,
                    obscureText: false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        (email != null && !EmailValidator.validate(email))
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
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: model.phoneNumber,
                    obscureText: false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => (value != null && value.length != 10)
                        ? 'Enter Valid Number without country code!'
                        : null,
                    decoration: InputDecoration(
                      hintText: 'Enter your number',
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
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                child: ElevatedButton(
                  onPressed: () async => await model.createContactUser(context),
                  child: const Text(
                    'Create User',
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
    );
  }

  Widget buildUser(ContactList user) {
    final curUser = FirebaseAuth.instance.currentUser!;
    if (curUser.email == user.owner) {
      // length++;
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 236, 241, 243),
            child: Text(
              user.fullName.substring(0, 1).toUpperCase(),
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(user.fullName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.email),
              Text(user.phoneNumber),
            ],
          ),
          trailing: GestureDetector(
            onTap: () {
              FirebaseFirestore.instance
                  .collection('contactList')
                  .doc(user.docId)
                  .delete();
            },
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      );
    } /* else if (length == 0) {
      return const Center(
        child: Text('Add Contact by using button bellow'),
      );
    }  */
    else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    Stream<List<ContactList>> readUsers() => FirebaseFirestore.instance
        .collection('contactList')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (doc) => ContactList.fromJson(
                doc.data(),
              ),
            )
            .toList());

    return ViewModelBuilder<UserViewModel>.reactive(
      viewModelBuilder: () => UserViewModel(),
      builder: (context, model, child) => Builder(
        builder: (context) {
          return StreamBuilder<List<ContactList>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong! ${snapshot.error}');
              } else if (snapshot.hasData) {
                final users = snapshot.data!;
                return GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Scaffold(
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => bottomModal(context, model),
                        );
                      },
                      backgroundColor: Colors.yellow.shade600,
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                    body: ListView(
                      children: users.map(buildUser).toList(),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
