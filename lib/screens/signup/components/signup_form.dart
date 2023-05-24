import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:look_back/settings/theme_config.dart';

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
              Navigator.pushNamed(context, '/login');
            },
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account ? " : "Already have an Account ? ",
          //style: const TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              //color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
