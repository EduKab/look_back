import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:look_back/settings/theme_config.dart';

class ForgotForm extends StatefulWidget {
  const ForgotForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();

    return Form(
      child: Column(
        children: [
          const SizedBox(height: defaultPadding / 2),
          const Text(
            "Forgot Password",
            style: TextStyle(
                fontFamily: 'Decipher',
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          const SizedBox(height: defaultPadding / 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: email,
              style: const TextStyle(color: Colors.black87),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              //cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.account_circle_rounded),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton.icon(
              icon: const Icon(Icons.key_outlined),
              onPressed: () async {
                try {
                  var em = email.text;
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: em)
                      .then((value) {
                    print('Email enviado ->  $em');
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: 'Message sent',
                      text:
                          'Verify your email $em in SPAM and reset your password',
                      confirmBtnText: 'Accept',
                      confirmBtnColor: Colors.green,
                    ).then((value) {
                      FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    });
                  });
                } on FirebaseAuthException catch (e) {
                  print('ERROR CODE-> ${e.code}');
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    title: 'Exception',
                    text: e.code,
                    confirmBtnText: 'Accept',
                    confirmBtnColor: Colors.green,
                  ).then((value) {
                    Navigator.pop(context);
                  });
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
              },
              label: const Text(
                "Reset Password",
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
