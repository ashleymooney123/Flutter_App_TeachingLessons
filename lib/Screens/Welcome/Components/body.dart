import 'package:can_med_app/Components/RoundedButton/rounded_button.dart';
import 'package:can_med_app/Screens/Login/login_screen.dart';
import 'package:can_med_app/Screens/Welcome/Components/background.dart';
import 'package:can_med_app/UI/Design/design.dart';
import 'package:can_med_app/Widgets/CustomDialog/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome to Can Medical!",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            "assets/icons/WelcomeScreen.svg",
            height: size.height * 0.45,
          ),
          SizedBox(height: size.height * 0.05),
          RoundedButton(
            press: (){
//Custom Dialog Pop out
            showDialog(
              context: context,
              builder:(BuildContext context) => CustomDialog(
                title: "Would you like to create a free account?",
                description: "With your account, your data will be securely saved. This will allow you to access it from multiple devices.",
                // secondaryButtonText: "Anonymous Login",
                // secondaryButtonRoute: "/anonymousSignIn",
                // primaryButtonText: "Anonymous Login",
                // primaryButtonRoute: "/anonymousSignIn",
                signUpButtonText: "Create an Account",
                signUpButtonRoute: "SignUpScreen",
              )
            );

            },
            text: "Get Started",
          ),
          TextButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context){
                        return LoginScreen();
                      })
                );
              },
              child: Text(
                "Login",
                style: TextStyle(color: kDarkTeal, fontSize: 18),
              )
          )
        ],
      ),
    ),
    );
  }
}
