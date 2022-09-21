import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:nasarover/components/login_text_style.dart';
import 'package:nasarover/gallery/view/rover_view.dart';

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
      appBar: AppBar(
        title: Text("Login With Facebook"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("User Email: "), Text(userEmail)],
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await signInWithFacebook();

                  setState(() {});
                },
                child: Text("Login with facebook")),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  userEmail = "";
                  await FacebookAuth.instance.logOut();
                  setState(() {});
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile', 'user_birthday']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData();

    userEmail = userData['email'];

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
} /*

 var loading = false;

  void signInWithFacebook() async {
    setState(() {
      loading = true;
    });

    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const RoverView()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      var content = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          content = 'This account exists with a different sign in provider';
          break;
        case 'invalid-credential':
          content = 'Unknown error has occurred';
          break;
        case 'operation-not-allowed':
          content = 'This operation is not allowed';
          break;
        case 'user-disabled':
          content = 'The user you tried to log into is disabled';

          break;
      }
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Log in with facebook failed'),
                content: Text(content),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Ok'),
                  )
                ],
              ));
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoginTextStyle('Mars Rovers'),
          _FacebookButton(
              color: Colors.blue,
              onPressed: () {
                signInWithFacebook();
              },
              text: 'Log in with Facebook'),
        ],
      )),
    );
  }
}

class _FacebookButton extends StatelessWidget {
  final Color color;

  final String text;
  final VoidCallback onPressed;

  const _FacebookButton({
    required this.color,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: GestureDetector(
            onTap: () {
              onPressed();
            },
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border.all(color: color),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(text, style: TextStyle(color: color, fontSize: 18)),
                      const SizedBox(
                        width: 35,
                      )
                    ],
                  ))
                ],
              ),
            )));
  }
} */
