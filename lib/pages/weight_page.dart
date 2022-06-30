import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class WeightPage extends StatelessWidget {
  final String logoImage = "assets/images/logo.png";
  static const routeName = '/weight_page';

  @override
  Widget build(BuildContext context) {

    var list = new List<int>.generate(150, (i) => i + 1);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(logoImage, width: 100 , height: 100,),
            const Text('How much is your weight?'),
            SizedBox(
              height: 400 ,
              child: CupertinoPicker(backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 1),
                onSelectedItemChanged: (int value) {  },
                children: [
                  for ( var i in list) Text(i.toString()),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  HomePage.routeName,
                );
              },
              child: const Text('Next'),)
          ],
        ),
      ),
    );
  }
}