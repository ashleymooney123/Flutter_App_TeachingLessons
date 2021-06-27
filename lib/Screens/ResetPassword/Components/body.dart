import 'package:can_med_app/Components/RoundedButton/rounded_button.dart';
import 'package:can_med_app/Screens/Login/login_screen.dart';
import 'package:can_med_app/Screens/ResetPassword/Components/background.dart';
import 'package:can_med_app/UI/Design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "Reset Password",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height:  size.height*0.03,),
            SvgPicture.asset("assets/icons/ResetPassword.svg",
            height: size.height*0.35,
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Enter Email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.person),
                        ),
                        onChanged: (input) => _email = input,
                      ),
                    ),
                    SizedBox(height:  size.height*0.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButton(
                          press:(){
                            reset();
                          },
                          text: "Submit",
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height:  size.height*0.03,),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Text("Return to Sign In",
                        style: TextStyle(color: kDarkTeal, fontWeight: FontWeight.bold),
                        ),
                        onTap: navigateToSignIn,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  void reset() {}

  void navigateToSignIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
