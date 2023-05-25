import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:look_back/components/footer_sign.dart';
import 'package:look_back/settings/model_theme.dart';
import 'package:provider/provider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:look_back/screens/dashboard/dashboard_screen.dart';
import 'package:look_back/settings/theme_config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final formGlobalKey = GlobalKey<FormState>();

  Color getBorder(ModelTheme themeNotifier) {
    int n = themeNotifier.chooseTheme;
    if(n==0 || n==2 || n==4){
      return Colors.white;
    }else{
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      final email = TextEditingController();
      final pass = TextEditingController();

      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GitHubSignIn githubSignIn = GitHubSignIn(
          clientId: '5563c664832c000335e9',
          clientSecret: '4a3ce46f64287df8378a3bcb6e1ddab48068452a',
          redirectUrl: 'https://look-back-90825.firebaseapp.com/__/auth/handler');

      const textStyle = TextStyle(
        letterSpacing: 4,
        fontFamily: 'Decipher',
        fontWeight: FontWeight.bold,
        fontSize: 30,
        shadows: [
          Shadow(
            blurRadius: 20.0, // shadow blur
            color: Color.fromARGB(255, 233, 30, 209), // shadow color
            offset: Offset(-2.0, 2.0), // how much shadow will be shown
          ),
        ],
      );

      const txt = 'SIGN IN';

      return Form(
        key: formGlobalKey,
        child: Column(
          children: [
            const SizedBox(height: defaultPadding / 2),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  txt,
                  style: textStyle.copyWith(
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..color = getBorder(themeNotifier)
                      ..strokeWidth = 5,
                    color: null,
                  ),
                ),
                const Text(txt, style: textStyle),
              ],
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/forgot');
              },
              child: const Text(
                'Forgot password?',
                textAlign: TextAlign.right,
                style: TextStyle(
                  //color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Hero(
              tag: "login_btn",
              child: ElevatedButton.icon(
                icon: const Icon(Icons.login),
                onPressed: () async {
                  var em = email.text;
                  var ps = pass.text;
                  if (em.isEmpty) {
                    print('EMAIL NULL');
                  } else if (ps.isEmpty) {
                    print('PASS NULL');
                  } else {
                    print('$em ---> $ps');

                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(email: em, password: ps)
                          .then((value) {
                        var user = FirebaseAuth.instance.currentUser;
                        if (user!.emailVerified) {
                          print('-> VERIFIED');
                          var data = [
                            'Email verified profile',
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
                          print('-> UNVERIFIED');
                          CoolAlert.show(
                              context: context,
                              type: CoolAlertType.confirm,
                              title: 'Unverified email',
                              text: 'Do you want to resend verification?',
                              confirmBtnText: 'Yes',
                              cancelBtnText: 'No',
                              confirmBtnColor: Colors.green,
                              onConfirmBtnTap: () async {
                                print('USER -> $user');
                                user = FirebaseAuth.instance.currentUser;
                                await user!.sendEmailVerification().then((value) {
                                  print('The verification email has been sent.');
                                  //
                                  CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.success,
                                    title: 'Message sent',
                                    text: 'Verify your email $em in SPAM',
                                    confirmBtnText: 'Accept',
                                    confirmBtnColor: Colors.green,
                                  ).then((value) {
                                    FirebaseAuth.instance.signOut();
                                  });
                                });
                              });
                        }
                      });
                      print('CRED -> $credential');
                    } on FirebaseAuthException catch (e) {
                      String txt = e.code;
                      print('ERROR CODE-> ${e.code}');
                      if (e.code == 'user-not-found') {
                        txt = 'No user found for that email.';
                        print(txt);
                      } else if (e.code == 'wrong-password') {
                        txt = 'Wrong password provided for that user.';
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
                      );
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
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
  });
  }
}
