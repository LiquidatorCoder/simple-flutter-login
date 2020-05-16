import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yehlo/screens/input_form.dart';
import 'package:yehlo/screens/sign_in.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        HapticFeedback.vibrate();
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return InputForm();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      highlightElevation: 0,
      padding: EdgeInsets.all(20),
      child: Ink(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFF70D9D6).withOpacity(0.8),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
            colors: [Color(0xff1E4746), Color(0xff70D9D6)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/google_logo.png"),
                height: 35.0,
                color: Color(0xFFF2F2F2),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontFamily: "Noto Sans",
                    fontSize: 20,
                    color: Color(0xFFF2F2F2),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
