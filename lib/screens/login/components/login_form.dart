import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:look_back/screens/dashboard/dashboard_screen.dart';
import 'package:look_back/screens/login/components/footer_account_acheck.dart';
import 'package:look_back/settings/theme_config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  showAlertDialog(BuildContext context, String title, String content) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final pass = TextEditingController();

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GitHubSignIn githubSignIn = GitHubSignIn(
        clientId: '5563c664832c000335e9',
        clientSecret: '4a3ce46f64287df8378a3bcb6e1ddab48068452a',
        redirectUrl: 'https://look-back-90825.firebaseapp.com/__/auth/handler');

    return Form(
      child: Column(
        children: [
          const SizedBox(height: defaultPadding / 2),
          const Text(
            "S i n g   I n",
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
          Hero(
            tag: "login_btn",
            child: ElevatedButton.icon(
              icon: const Icon(Icons.login),
              onPressed: () {
                var em = email.text;
                var ps = pass.text;
                if (em == "") {
                  showAlertDialog(
                      context, 'Empty field', 'Complete Email field');
                } else if (ps == "") {
                  showAlertDialog(
                      context, 'Empty field', 'Complete Password field');
                } else {
                  if (isEmail(em)) {
                    var data = [
                      'Default profile',
                      'https://i.pinimg.com/474x/30/04/21/3004214c3132a490eefad066c6da759b.jpg',
                      em,
                      'Default'
                    ];
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return DashboardScreen(
                            data: data,
                          );
                        },
                      ),
                    );
                  } else {
                    showAlertDialog(
                        context, 'Incorrect email', 'Incorrect Email format');
                  }
                }
              },
              label: const Text(
                "Login",
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          const Text(
            'Sign in with',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding / 2),
          Row(
            children: <Widget>[
              SocialLoginButton(
                  buttonType: SocialLoginButtonType.google,
                  mode: SocialLoginButtonMode.single,
                  borderRadius: 30,
                  onPressed: () async {
                    if (await googleSignIn.isSignedIn()) {
                      googleSignIn.signOut();
                      print('C CERROOO');
                    }
                    googleSignIn.signIn().then((value) async {
                      var data = [
                        value!.displayName!,
                        value.photoUrl!,
                        value.email,
                        'Google'
                      ];
                      print('DATA -> $data');
                      googleSignIn.signOut();
                      if (data.isEmpty) {
                        print('NO DATA AAAAAAAAAAA');
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DashboardScreen(
                                data: data,
                              );
                            },
                          ),
                        );
                      }
                    });
                  }),
              const SizedBox(width: defaultPadding / 2),
              SocialLoginButton(
                  buttonType: SocialLoginButtonType.github,
                  mode: SocialLoginButtonMode.single,
                  borderRadius: 30,
                  onPressed: () async {
                    githubSignIn.signIn(context).then((value) async {
                      print('VAL -> ${value.token}');
                      print('ST -> ${value.status}');
                      FirebaseAuth.instance.signInWithCredential(
                          GithubAuthProvider.credential(value.token!));
                      User? userGithub = FirebaseAuth.instance.currentUser;
                      print('USR GITHUB -> $userGithub');
                      //print('email GITHUB -> ${userGithub!.providerData[0].email}');
                      var data = [
                        userGithub!.providerData[0].displayName,
                        userGithub.providerData[0].photoURL,
                        userGithub.providerData[0].email,
                        'GitHub'
                      ];
                      print('DATA -> $data');
                      FirebaseAuth.instance.signOut();
                      if (data.isEmpty) {
                        print('NO DATA AAAAAAAAAAA');
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DashboardScreen(
                                data: data,
                              );
                            },
                          ),
                        );
                      }
                    });
                  }),
              const SizedBox(width: defaultPadding / 2),
            ],
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
          const SizedBox(height: defaultPadding / 2),
        ],
      ),
    );
  }
}
