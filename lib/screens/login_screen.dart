import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrounds/Fondo Look Back.jpg'),
            fit: BoxFit.fill
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/Logo_Look_Back.png'),
                    height: 350,
                    width: 350,
                  )
                ],
              ),
              Container(
                //decoration: BoxDecoration(
                  //image: DecorationImage(image: AssetImage(''))
                //),
                child: const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    label: Text('Email'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    )
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  label: Text('Password'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  )
                ),
              ),
              const SizedBox(height: 10),
              SocialLoginButton(
                buttonType: SocialLoginButtonType.generalLogin, 
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
                }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child: Text('Recovery password')),
                ],
              ),
              const SizedBox(height: 20),
              SocialLoginButton(buttonType: SocialLoginButtonType.google, onPressed: (){}),
              const SizedBox(height: 10), 
              SocialLoginButton(buttonType: SocialLoginButtonType.github, onPressed: (){}),
              const SizedBox(height: 20),
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/register');
                }, 
                child: Text('Create new account'))
            ]
          ),
        ),
      )
    );
  }
}