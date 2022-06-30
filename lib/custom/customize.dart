import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../services/auth.dart';

Auth _authService = Auth();

class Customize extends StatefulWidget {
  const Customize({Key? key, required this.text, required this.icon}) : super(key: key);
  final String text;
  final IconData icon ;

  @override
  _CustomizeState createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> {
  var colorState = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () async{
        colorState =!colorState;
        UserModel? user = await _authService.currentUser();
        user?.gender = widget.text;
        _authService.updatePerson(user!.uid!, user);
        setState(() {
        });
      },
      child: Column(
        children: [
          Icon(
            widget.icon,
            color: colorState? Colors.orange : Colors.green,
          ),
          Text(widget.text),
        ],
      ),
    );
  }
}
