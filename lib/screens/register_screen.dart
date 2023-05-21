import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:look_back/widgets/image_picker_widget.dart';
import 'package:look_back/widgets/loading_modal_widget.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool isLoading = false;
  bool isEmailCorrect = false;
  bool _isObscure = true;
  bool _isObscPassConfirm = true;
  String userEmail = '';
  String userPassword = '';

  TextEditingController textEditingController = TextEditingController();

  File? image;

  String pathImag = 'assets/images/users/user_default.jpg';

  final formRegister = GlobalKey<FormState>();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  final imageTitle = Image.asset(
    '',
  );
  final txtRegiName = TextFormField(
    decoration: const InputDecoration(
        label: Text('Name'), border: OutlineInputBorder(), hintText: 'Eduardo'),
    validator: ((value) {
      if (value!.isEmpty ||
          RegExp(r'^[A-Za-záéíóúñ]{2,}([\s][A-Za-záéíóúñ]{2,})$')
              .hasMatch(value)) {
        return "Enter Correct Name";
      } else {
        return null;
      }
    }),
  );
  final txtRegiLastName = TextFormField(
      decoration: const InputDecoration(
          label: Text('Lastname'),
          border: OutlineInputBorder(),
          hintText: 'Cabrera'),
      validator: ((value) {
        if (value!.isEmpty ||
            RegExp(r'^[A-Za-záéíóúñ]{2,}([\s][A-Za-záéíóúñ]{2,})$')
                .hasMatch(value)) {
          return "Enter Correct LastName";
        } else {
          return null;
        }
      }));

  final spaceHorizontal = const SizedBox(
    height: 10,
  );

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    final imageUser = ImagePickerWidget(
      fileImage: image,
      onClicked: () async {
        pickImage();
      },
    );

    final btnRegister = SocialLoginButton(
        buttonType: SocialLoginButtonType.generalLogin,
        onPressed: () {
          if (formRegister.currentState!.validate() && isEmailCorrect == true) {
            isLoading = true;
            setState(() {});
            Future.delayed(const Duration(milliseconds: 4000)).then((value) {
              isLoading = false;
              setState(() {});
              Navigator.pop(context);
            });
          }
        },
        text: 'Register');

    final txtRegiEmailConfirm = TextFormField(
        decoration: const InputDecoration(
            label: Text('Email Confirm'), border: OutlineInputBorder()),
        validator: (value) {
          if (userEmail != value) {
            return 'Emails do not match';
          } else {
            return null;
          }
        });

    
    final tffPassword = TextFormField(
        obscureText: _isObscure,
        decoration:InputDecoration(
            label: const Text('Password'), 
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  _isObscure = !_isObscure;
                });
              }, 
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off)
            )
        ),
        validator: ((value) {
          if (value!.isEmpty || value.length < 8) {
            return "Enter Correct Password Of 8 Digits";
          } else {
            userPassword = value;
            return null;
          }
        }));

    final tffPassConfirm = TextFormField(
        obscureText: _isObscPassConfirm,
        decoration: InputDecoration(
            label: const Text('Password Confirm'), 
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  _isObscPassConfirm = !_isObscPassConfirm;
                });
              }, 
              icon: Icon(_isObscPassConfirm ? Icons.visibility : Icons.visibility_off)
            )
        ),
        validator: (value) {
          if (userPassword != value) {
            return 'Passwords do not match';
          } else {
            return null;
          }
        });

    return Scaffold(
      body: Stack(
        children: [
            Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 50),
                    child: SingleChildScrollView(
                      child: 
                        Form(
                          key: formRegister,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              spaceHorizontal,
                              imageUser,
                              spaceHorizontal,
                              txtRegiName,
                              spaceHorizontal,
                              txtRegiLastName,
                              spaceHorizontal,
                              textFieldEmail(),
                              spaceHorizontal,
                              txtRegiEmailConfirm,
                              spaceHorizontal,
                              tffPassword,
                              spaceHorizontal,
                              tffPassConfirm,
                              spaceHorizontal,
                              btnRegister
                            ],
                          ),
                        ),
                    )),
          isLoading ? const LoadingModalWidget() : Container()
        ],
      ),
    );
  }

  TextFormField textFieldEmail() {
    return TextFormField(
      controller: textEditingController,
      onChanged: (val) {
        setState(() {
          isEmailCorrect = EmailValidator.validate(val);
          userEmail = val;
        });
      },
      validator: (val) {
         if (isEmailCorrect == false) {
            return 'Invalid Email';
          } else {
            return null;
          }
      },
      decoration: InputDecoration(
          label: const Text('Email'),
          hintText: 'example@email.com',
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.email, color: Colors.black),
          suffixIcon: isEmailCorrect == false
              ? const Icon(Icons.close, color: Colors.red)
              : const Icon(Icons.check, color: Colors.green),
          focusedBorder: OutlineInputBorder(
              borderSide: isEmailCorrect == false
                  ? const BorderSide(color: Colors.red, width: 2)
                  : const BorderSide(color: Colors.green, width: 2))),
    );
  }

  Future pickImage() async {
    final color = Theme.of(context).colorScheme.primary;

    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Seleccionar imagen de...'),
                  const SizedBox(height: 15),
                  MaterialButton(
                    minWidth: 200,
                    height: 40,
                    color: color,
                    onPressed: () async {
                      Navigator.pop(context);
                      final image2 = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image2 == null) return;
                      final imageTemp = File(image2.path);

                      setState(() => image = imageTemp);
                    },
                    child: const Text('Galeria',
                        style: TextStyle(color: Colors.white)),
                  ),
                  MaterialButton(
                    minWidth: 200,
                    height: 40,
                    color: color,
                    onPressed: () async {
                      Navigator.pop(context);
                      final image2 = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (image2 == null) return;
                      final imageTemp = File(image2.path);

                      setState(() => image = imageTemp);
                    },
                    child: const Text('Usar camara',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            )));

    //on PlatformException catch (e) {
    //Mensaje de que no se pudo obtener la imagen
    //}
  }
}