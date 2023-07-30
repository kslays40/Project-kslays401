import 'package:aithinkism/loader.dart';
import 'package:aithinkism/signup.dart';
import 'package:aithinkism/skiplogin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}


class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  var email;
  var password;
  void createuser() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      const snackdemo = SnackBar(
        content: Text('Account Created'),
        backgroundColor: Color(0xFF48bdff),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);

      // 'showSnackBar' is deprecated and shouldn't be used.
      //Use ScaffoldMessenger.showSnackBar.
      // Scaffold.of(context).showSnackBar(snackdemo);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        const snackdemo = SnackBar(
          content: Text('The password provided is too weak.'),
          backgroundColor: Color(0xFF48bdff),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);

        // 'showSnackBar' is deprecated and shouldn't be used.
        //Use ScaffoldMessenger.showSnackBar.
        // Scaffold.of(context).showSnackBar(snackdemo);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        const snackdemo = SnackBar(
          content: Text('The account already exists for that email.'),
          backgroundColor: Color(0xFF48bdff),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);

        // 'showSnackBar' is deprecated and shouldn't be used.
        //Use ScaffoldMessenger.showSnackBar.
        // Scaffold.of(context).showSnackBar(snackdemo);
      }
    } catch (e) {
      print(e);
    }
  }

  var verifiedemail;
  var verifiedpassword;

  void verifyuser() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: verifiedemail,
        password: verifiedpassword,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => loader(),
        ),
      );
      const snackdemo = SnackBar(
        content: Text('Login Successfull'),
        backgroundColor: Color(0xFF48bdff),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);

      // 'showSnackBar' is deprecated and shouldn't be used.
      //Use ScaffoldMessenger.showSnackBar.
      // Scaffold.of(context).showSnackBar(snackdemo);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        const snackdemo = SnackBar(
          content: Text('No user found for that email.'),
          backgroundColor: Color(0xFF48bdff),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);

        // 'showSnackBar' is deprecated and shouldn't be used.
        //Use ScaffoldMessenger.showSnackBar.
        // Scaffold.of(context).showSnackBar(snackdemo);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        const snackdemo = SnackBar(
          content: Text('Wrong password provided for that user.'),
          backgroundColor: Color(0xFF48bdff),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);

        // 'showSnackBar' is deprecated and shouldn't be used.
        //Use ScaffoldMessenger.showSnackBar.
        // Scaffold.of(context).showSnackBar(snackdemo);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => skiplogin()),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(fontSize: 18, color: Color(0xFF48bdff)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  SizedBox(
                    width: 60,
                  ),
                  Image.asset(
                    "images/siginrobo.png",
                    width: 250.0,
                    height: 250.0,
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Your Email',
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                onChanged: (value) {
                  email = value;
                  verifiedemail = email;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Your Password',
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                onChanged: (value) {
                  password = value;
                  verifiedpassword = password;
                },
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  createuser();
                  verifyuser();
                },
                child: Container(
                    height: 50,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Color(0xFF48bdff),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Center(
                        child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ))),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: (){
                  signInWithGoogle();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loader(),
                    ),
                  );
                },
                child: Image.asset("images/googleicon.png",height: 40,width: 40,),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signup()),
                    );
                  },
                  child: Text(
                    "New User Sign Up",
                    style: TextStyle(
                      color: Color(0xFF48bdff),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
