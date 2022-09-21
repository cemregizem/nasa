import 'package:flutter/material.dart';

class LoginTextStyle extends StatelessWidget{
  final String text;
  const LoginTextStyle(this.text);

  Widget build(BuildContext context){
    return Text(text,
    style: TextStyle(color:Theme.of(context).primaryColor,
    fontSize:25,
    fontWeight:FontWeight.w600));
  }
  
}