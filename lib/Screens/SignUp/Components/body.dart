import 'package:can_med_app/Components/RoundedButton/rounded_button.dart';
import 'package:can_med_app/Screens/Login/Components/background.dart';
import 'package:can_med_app/Screens/Login/login_screen.dart';
import 'package:can_med_app/Screens/SignUp/Components/divider.dart';
import 'package:can_med_app/Screens/SignUp/Components/social_icon.dart';
import 'package:can_med_app/UI/Design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name , _email , _password;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height*0.03,),
              Text("Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: size.height*0.03,),
              SvgPicture.asset("assets/icons/SignupScreen.svg",
              height:  size.height*0.29,
              ),
              //Username
              Container(
                child:  Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                          validator: (input) {
                            if(input.isEmpty)
                              return "Please Enter User Name";
                          },
                          decoration:  InputDecoration(
                            labelText: "Name",
                            prefixIcon: Icon(Icons.person),
                          ),
                          onSaved: (input)=> _name = input,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //Email
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
              //Password
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
              SizedBox(height: size.height*0.03,),
              RoundedButton(
                press: () {
                  signUp();
                },
                text: "Sign Up",
              ),
              SizedBox(height: size.height*0.03,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text(
      "Already have an account?",
      style: TextStyle(color: kDarkTeal),
    ),
    SizedBox(width: size.width*0.02,),
    GestureDetector(
      onTap: (){
        navigateToLoginScreen();
      },
      child: Text("Sign In",
      style: TextStyle(fontWeight: FontWeight.bold, color: kDarkTeal),
      ),
    )
  ],
),
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
        )
    );
  }

  void signUp() {

  }

  void FacebookSignin() {

  }

  void GoogleSignin() {

  }

  void navigateToLoginScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
