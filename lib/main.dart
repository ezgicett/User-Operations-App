import 'package:flutter/material.dart';
import 'package:test_pro/pages/age_page.dart';
import 'package:test_pro/pages/gender_page.dart';
import 'package:test_pro/pages/home_page.dart';
import 'package:test_pro/pages/landing_page.dart';
import 'package:test_pro/pages/name_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_pro/pages/weight_page.dart';
import 'package:test_pro/pages/length_page.dart';
import 'services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Pro',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => LandingPage(),
              // builder: (context) => Expense_Details(),
            );

          case Auth.routeName:
            return MaterialPageRoute(
              builder: (context) => Auth(),
              // builder: (context) => Expenses(),
            );
          case LandingPage.routeName:
            return MaterialPageRoute(
              builder: (context) => LandingPage(),
              // builder: (context) => Expenses(),
            );
          case NamePage.routeName:
            return MaterialPageRoute(
              builder: (context) => NamePage(),
              // builder: (context) => Expenses(),
            );
          case GenderPage.routeName:
            return MaterialPageRoute(
              builder: (context) => GenderPage(),
              // builder: (context) => Expenses(),
            );
          case AgePage.routeName:
            return MaterialPageRoute(
              builder: (context) => AgePage(),
              // builder: (context) => Expenses(),
            );
          case LengthPage.routeName:
            return MaterialPageRoute(
              builder: (context) => LengthPage(),
              // builder: (context) => Expenses(),
            );
          case WeightPage.routeName:
            return MaterialPageRoute(
              builder: (context) => WeightPage(),
              // builder: (context) => Expenses(),
            );
          case HomePage.routeName:
            return MaterialPageRoute(
              builder: (context) => HomePage(),
              // builder: (context) => Expenses(),
            );
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  
  
  

  
  
  
  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {





      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {






    return Scaffold(
      appBar: AppBar(


        title: Text(widget.title),
      ),
      body: Center(


        child: Column(














          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/