import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yehlo/screens/carousel.dart';

class SubmitButton extends StatefulWidget {
  Function function;
  SubmitButton(this.function);
  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        HapticFeedback.vibrate();
        widget.function();
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Carousel();
            },
          ),
        );
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
            borderRadius: BorderRadius.circular(50.0)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Submit',
                style: TextStyle(
                  fontFamily: "Noto Sans",
                  fontSize: 20,
                  color: Color(0xFFF2F2F2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Color(0xFFF2F2F2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
