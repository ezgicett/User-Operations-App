import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../services/auth.dart';
import 'length_page.dart';

Auth _authService = Auth();

class AgePage extends StatelessWidget {
  final String logoImage = "assets/images/logo.png";
  static const routeName = '/age_page';

  @override
  Widget build(BuildContext context) {
    final String logoImage = "assets/images/logo.png";
    var selectedValue;
    var list = new List<int>.generate(120, (i) => i + 1);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(logoImage, width: 100 , height: 100,),
            const Text('How old are you?'),
            SizedBox(
              height: 400 ,
              child: CupertinoPicker(backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 1),
                onSelectedItemChanged: (int value) { selectedValue =value+1; },
                children: [
                  for ( var i in list) Text(i.toString()),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async{
                UserModel? user = await _authService.currentUser();
                user?.age = selectedValue.toString();
                _authService.updatePerson(user!.uid!, user);
                Navigator.pushNamed(
                  context,
                  LengthPage.routeName,
                );
              },
              child: const Text('Next'),)
          ],
        ),
      ),
    );
  }
}