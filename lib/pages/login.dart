import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/auth.dart';
import 'home_page.dart';
import 'landing_page.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final controllerEmail = TextEditingController();
final controllerPassword = TextEditingController();
final controllerReWritePassword =  TextEditingController();
Auth _authService = Auth();

class Login extends StatefulWidget{
  static const routeName = '/login';
  final Function toggleView;
  Login({required this.toggleView});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
            Navigator.pushNamed(
            context,
            LandingPage.routeName,
            );
          },
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            widget.toggleView();
                          },
                          child: Text('Sign Up'),
                        ),
                      ),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Sign In'),
                          )
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FractionallySizedBox(
                        widthFactor: 0.75,
                        child: TextFormField(
                          controller: controllerEmail,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          autocorrect: false,
                          //validator: validateEmpty,
                          decoration: const InputDecoration(
                            hintText: 'Email address',
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 20),
                      FractionallySizedBox(
                        widthFactor: 0.75,
                        child: TextFormField(
                          controller: controllerPassword,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          autocorrect: false,
                          obscureText: true,
                          //validator: validateEmpty,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 20),
                      RawMaterialButton(
                        onPressed: () async {
                          final username = controllerEmail.text.trim();
                          final password = controllerPassword.text.trim();

                          final email = controllerEmail.text.trim();
                          _authService.signIn(email, password).then((value) {
                            return Navigator.pushNamed(
                              context,
                              HomePage.routeName,
                            );
                          });
                        },
                        elevation: 2.0,
                        fillColor: Color(0xff6a60a9),
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          size: 20.0,
                        ),
                        shape: CircleBorder(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 32,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text(
                            'Forget Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text('Enter for registration'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }}
