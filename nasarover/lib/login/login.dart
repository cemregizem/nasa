import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:nasarover/gallery/view/rover_view.dart';
import 'package:nasarover/components/customButton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String userEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/mars.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.black54,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    " Nasa Rovers",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 60.0,
                        color: Colors.white // light
                        // italic
                        ),
                  )
                ],
              ),
            ),
            CustomButton(
                color: Colors.blue,
                image: const AssetImage("assets/images/facebook.png"),
                onPressed: () async {
                  await signInWithFacebook();
                  if (userEmail != '') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return RoverView();
                    }));
                  }
                  setState(() {});
                },
                text: 'Log in with Facebook'),

          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {

    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile', 'user_birthday']);


    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData();

    userEmail = userData['email'];


    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
