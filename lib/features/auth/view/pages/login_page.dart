import 'package:ezrent/features/auth/services/auth_service.dart';
import 'package:ezrent/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:ezrent/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((account) {
      if (mounted) {
        setState(() {});
      }
    });

    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/demo_2.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 3),
                  Text(
                    "Login to Ezrent",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),

                  SizedBox(height: 30),

                  AuthGradientButton(
                    onTap: () async {
                      bool result = await FirebaseServices().signInWithGoogle();

                      if (result) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPage()),
                        );
                      }
                    },
                    buttonText: "Continue with google account",
                    iconAsset: 'assets/images/Google_icon.webp',
                    iconHeigth: 22,
                    iconWidth: 22,
                  ),

                  SizedBox(height: 20),

                  // AuthGradientButton(
                  //   buttonText: "Continue with apple account",
                  //   iconAsset: 'assets/images/apple_logo.webp',
                  //   iconHeigth: 30,
                  //   iconWidth: 30,
                  // ),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
