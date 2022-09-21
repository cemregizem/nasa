import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nasarover/login/login.dart';

import 'package:provider/provider.dart';
import 'package:nasarover/gallery/view/rover_view.dart';
import 'package:nasarover/gallery/viewmodel/rover_list_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
/*
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
            create: (context) => RoverListViewModel(), child: const Login()));
  } */
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => RoverListViewModel()),

        ],
        child: MaterialApp(
          home: const Login()
        ));
}
}