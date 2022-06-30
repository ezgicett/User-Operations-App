import 'package:flutter/material.dart';
import '../custom/customize.dart';
import '../services/auth.dart';
import 'age_page.dart';

Auth _authService = Auth();

class GenderPage extends StatelessWidget {
  static const routeName = '/gender_page';
  final controllerGender = TextEditingController();
  final String logoImage = "assets/images/logo.png";

  @override
  Widget build(BuildContext context) {
    var isPressed = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                  child: Image.asset(logoImage, width: 100 , height: 100,)),
              const Expanded(
                flex: 2,
                  child: Text('Choose Your Gender')),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Customize(text: "Female", icon: Icons.female),
                    SizedBox(
                      width: 150,
                    ),
                    Customize(text: "Male", icon: Icons.male),
                  ],
                ),
              ),
              Expanded(
                flex:1,
                child: ElevatedButton(
                  onPressed: () async{
                    Navigator.pushNamed(
                      context,
                      AgePage.routeName,
                    );
                  },
                  child: const Text('Next')),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

