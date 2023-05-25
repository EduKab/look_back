import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:look_back/components/footer_sign.dart';
import 'package:look_back/settings/theme_config.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    // final fname = TextEditingController();
    // final lname = TextEditingController();
    final email = TextEditingController();
    final pass = TextEditingController();

    return Form(
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 5),
          //   child: TextFormField(
          //     controller: fname,
          //     style: TextStyle(color: Colors.black87),
          //     keyboardType: TextInputType.emailAddress,
          //     textInputAction: TextInputAction.next,
          //     //cursorColor: kPrimaryColor,
          //     onSaved: (email) {},
          //     decoration: const InputDecoration(
          //       hintText: "Your first name",
          //       prefixIcon: Padding(
          //         padding: const EdgeInsets.all(defaultPadding),
          //         child: Icon(Icons.badge_rounded),
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 5),
          //   child: TextFormField(
          //     controller: lname,
          //     style: TextStyle(color: Colors.black87),
          //     keyboardType: TextInputType.emailAddress,
          //     textInputAction: TextInputAction.next,
          //     //cursorColor: kPrimaryColor,
          //     onSaved: (email) {},
          //     decoration: const InputDecoration(
          //       hintText: "Your last name",
          //       prefixIcon: Padding(
          //         padding: const EdgeInsets.all(defaultPadding),
          //         child: Icon(Icons.assignment_ind_rounded),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: email,
              style: TextStyle(color: Colors.black87),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              //cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.account_circle_rounded),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: pass,
              style: const TextStyle(color: Colors.black87),
              textInputAction: TextInputAction.done,
              obscureText: true,
              //cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton.icon(
            icon: Icon(Icons.assignment_ind_rounded),
            onPressed: () async {
              // var fn = fname.text;
              // var ln = lname.text;
              var em = email.text;
              var ps = pass.text;
              if (em.isEmpty) {
                print('EMAIL NULL');
              } else if (ps.isEmpty) {
                print('PASS NULL');
              } else {
                try {
                  User? user;
                  final credential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: em,
                    password: ps,
                  )
                      .then((value) async {
                    print('The email has been created');
                    user = FirebaseAuth.instance.currentUser;
                    print('USER -> $user');
                    await user!.sendEmailVerification().then((value) {
                      FirebaseAuth.instance.signOut();
                      print('The verification email has been sent');
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.success,
                        title: 'Account created',
                        text: 'The verification email has been sent',
                        confirmBtnText: 'Accept',
                        confirmBtnColor: Colors.green,
                      ).then((value) {
                        FirebaseAuth.instance.signOut();
                        Navigator.pop(context);
                      });
                      //
                    });
                  });
                  print('CRED -> $credential');
                } on FirebaseAuthException catch (e) {
                  String txt = e.code;
                  print('ERROR CODE-> ${e.code}');
                  if (e.code == 'weak-password') {
                    txt = 'The password provided is too weak.';
                    print(txt);
                  } else if (e.code == 'email-already-in-use') {
                    txt = 'The account already exists for that email.';
                    print(txt);
                  }
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    title: e.code,
                    text: txt,
                    confirmBtnText: 'Accept',
                    confirmBtnColor: Colors.green,
                  );
                } catch (e) {
                  print('ERROR -> $e');
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    title: 'Exception',
                    text: e.toString(),
                    confirmBtnText: 'Accept',
                    confirmBtnColor: Colors.green,
                  ).then((value) {
                    Navigator.pop(context);
                  });
                }
              }
            },
            label: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}

class SignUpScreenTopImage extends StatefulWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreenTopImage> createState() => _SignUpScreenTopImageState();
}

class _SignUpScreenTopImageState extends State<SignUpScreenTopImage> {

  File? _image;
  final _picker = ImagePicker();

  // Implementing the gallery
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  // Implementing the camera
  Future<void> _openCameraPicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPadding/2),
        
        SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Column(
                children: [

                  const Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),

                  const SizedBox(height: defaultPadding / 2),
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    color: Colors.black26,
                    child: _image != null
                        ? Image.file(_image!, fit: BoxFit.cover,)
                        : Image.asset('assets/customs/bob_cholo.png', fit: BoxFit.cover,)
                        // : const Text(
                        //   'Please select an image',
                        //   style: TextStyle(color: Colors.black),
                        // ),
                  ),
                  const SizedBox(height: defaultPadding / 2),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _openImagePicker,
                          icon: const Icon(Icons.add_photo_alternate_rounded),
                          label: const Text('Select An Image from Gallery'),
                        ),
                      ),
                      const SizedBox(width: defaultPadding / 2),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _openCameraPicker,
                          icon: const Icon(Icons.add_a_photo_rounded),
                          label: const Text('Select An Image from Camera'),
                        ),
                      ),
                    ],
                  )
                  
                ],
              ),
              
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}

