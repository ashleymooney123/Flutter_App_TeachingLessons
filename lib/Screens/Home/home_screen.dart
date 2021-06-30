import 'package:can_med_app/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen", style: TextStyle(color: Colors.white),),
        actions: [
          TextButton.icon(
            label: Text("Back", style: TextStyle(color: Colors.white)),
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              }
          ),
        ],
      ),
    );
  }
}
