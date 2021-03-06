import 'package:can_med_app/Components/RoundedButton/rounded_button.dart';
import 'package:can_med_app/Screens/Login/Components/background.dart';
import 'package:can_med_app/Screens/Login/Components/divider.dart';
import 'package:can_med_app/Screens/Login/Components/social_icon.dart';
import 'package:can_med_app/UI/Design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(
            "assets/icons/LoginScreen.svg",
            height: size.height * 0.35,
          ),
          Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                        // ignore: missing_return
                        validator: (input) {
                          if (input.isEmpty) return "Enter Email";
                        },
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                        onSaved: (input) => _email = input),
                  ),
                  Container(
                    child: TextFormField(
                        // ignore: missing_return
                        validator: (input) {
                          if (input.length < 6)
                            return "Provide Minimum 6 characters";
                        },
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        onSaved: (input) => _password = input),
                  ),
                  SizedBox(height: 20),
                  RoundedButton(
                    press: () {
                      login();
                    },
                    text: "Login",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text("Create an Account",
                        style: TextStyle(
                            color: kPrimaryTeal, fontWeight: FontWeight.bold)),
                    onTap: () {
//Navigate to Sign Up
                    },
                  ),
                  SizedBox(width: size.width * 0.10),
                  GestureDetector(
                    child: Text("Forgot Password",
                        style: TextStyle(
                            color: kPrimaryTeal, fontWeight: FontWeight.bold)),
                    onTap: () {
                      //Navigate to forgot password
                    },
                  ),
                ],
              )
            ],
          )),
          OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SocialIcon(
                iconSrc: "assets/icons/facebook.svg",
                press: () {
                  FacebookSignin();
                },
              ),
              SizedBox(width: 20),
              SocialIcon(
                iconSrc: "assets/icons/google-plus.svg",
                press: () {
                  GoogleSignin();
                },
              ),
            ],
          )
        ],
      ),
    ));
  }

  void login() {}
}

class GoogleSignin {}

class FacebookSignin {}
