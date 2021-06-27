import 'package:auto_size_text/auto_size_text.dart';
import 'package:can_med_app/Components/RoundedButton/rounded_button.dart';
import 'package:can_med_app/Screens/SignUp/signup_screen.dart';
import 'package:can_med_app/UI/Design/design.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String title,
  description,
  primaryButtonText,
  primaryButtonRoute,
      secondaryButtonText,
  secondaryButtonRoute,
  signUpButtonText,
  signUpButtonRoute
  ;

  CustomDialog({
    this.title,
    this.description,
    this.primaryButtonText,
    this.primaryButtonRoute,
    this.secondaryButtonText,
    this.secondaryButtonRoute,
    this.signUpButtonText,
    this.signUpButtonRoute
});
  static const double padding = 10.0;

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final primaryColor = kDarkTeal;
  final backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) =>
      Dialog(
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(CustomDialog.padding),
),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(CustomDialog.padding),
              decoration: BoxDecoration(
                  color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(CustomDialog.padding),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius:  10.0,
                    offset: const Offset(0.0, 10.0)
                  ),
                ]
              ),
              child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 10),
                  AutoSizeText(
                   widget.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kDarkTeal,
                      fontSize: 25
                    ),
                  ),
                  SizedBox(height: 10),
                  AutoSizeText(
                    widget.description,
                    maxLines: 8,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
showCreateAccountButton(context),
                  SizedBox(height: 10),
showPrimaryButton(context),
                ],
              ),
            )
          ],
        ),
      );

  showCreateAccountButton(BuildContext context) {
    if(widget.signUpButtonText != null && widget.signUpButtonRoute != null){
      return
          RoundedButton(
            press: (){
              //Navigator.of(context).pushReplacementNamed(widget.signUpButtonRoute);
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            text: "Create an Account"
          );
    }else{
      return SizedBox(height: 1,);
    }
  }

  showPrimaryButton(BuildContext context) {
    if(widget.primaryButtonText != null && widget.primaryButtonRoute != null){
      return
        RoundedButton(
            press: (){
              Navigator.of(context).pushReplacementNamed(widget.signUpButtonRoute);
            },
            text: "Primary Button"
        );
    }else{
      return SizedBox(height: 1,);
    }
  }


}

