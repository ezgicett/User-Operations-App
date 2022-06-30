import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../services/auth.dart';
import 'gender_page.dart';

class NamePage extends StatelessWidget{
  Auth _authService = Auth();
  final controllerUserName = TextEditingController();
  static const routeName = '/name_page';

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Your name'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: controllerUserName,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  //validator: validateEmpty,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final userName = controllerUserName.text.trim();
                    UserModel? user = await _authService.currentUser();
                    user?.name = userName;
                    _authService.updatePerson(user!.uid!, user);
                    Navigator.pushNamed(
                      context,
                      GenderPage.routeName,
                    );
                  },
                  child: const Text('Continue'),)
            ],
          ),
        ),
      ),
    );
  }
}