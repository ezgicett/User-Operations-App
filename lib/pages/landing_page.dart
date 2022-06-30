import 'package:flutter/material.dart';
import '../services/auth.dart';
import 'package:test_pro/pages/name_page.dart';

Auth _authService = Auth();


class LandingPage extends StatelessWidget{
  final String logoImage = "assets/images/logo.png";
  static const routeName = '/landing_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:   <Widget>[
            Expanded(
                flex:5,
                child: Image.asset(logoImage)),
          Expanded(
            flex: 3,
            child: Text("Description"),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print("Clicked");
                    Navigator.pushNamed(
                      context,
                      Auth.routeName,
                      arguments: true,
                    );
                  },
                  child: Text("Continue with Email"),
                ),
              ),
            ),
          ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _authService.signInAnonym();
                      print("Clicked");
                      Navigator.pushNamed(
                        context,
                        NamePage.routeName,
                        arguments: false,
                      );
                    },
                    child: Text("Continue without Signing-Up"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],

    ),
      ),
    );


  }

}





