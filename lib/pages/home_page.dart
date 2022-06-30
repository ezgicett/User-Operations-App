import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/pages/landing_page.dart';
import '../services/auth.dart';
Auth _authService = Auth();


class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  final String img = "assets/images/fitness.png";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black54,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  _authService.signOut();
                  Navigator.pushNamed(
                    context,
                    Auth.routeName,
                  );
                },
                child: const Icon(
                    Icons.login_sharp,
                ),
              )
          ),

        ],
      ),
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(img),
            SizedBox(height: 100),
            const Text(
            'Individual exercises, workouts in your pocket\nPush Harder, Lift Heavier, Eat Better!\nChallange yourself \n',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 19
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite, color: Colors.red),
                SizedBox(width: 50),
                Icon(Icons.add_task_sharp, color: Colors.red),
                SizedBox(width: 50),
                Icon(Icons.health_and_safety_sharp, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}