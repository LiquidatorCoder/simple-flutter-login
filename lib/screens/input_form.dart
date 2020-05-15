import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1440, allowFontScaling: true);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/bg.png"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              margin: EdgeInsets.all(0),
              color: Color(0xFFF2F2F2),
              child: SizedBox(
                height: 980.h,
                width: 720.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                        child: Text(
                          "Details",
                          style: TextStyle(
                            fontFamily: "Berkshire Swash",
                            fontSize: 58,
                            color: Color(0xFF1E4746),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff1E4746).withOpacity(0.1),
                              Color(0xff70D9D6).withOpacity(0.1)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.red,
                            labelText: "PG Name",
                            labelStyle: TextStyle(
                              fontFamily: "Noto Sans",
                              color: Color(0xFF1E5C5A),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Color(0xFF1E5C5A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff1E4746).withOpacity(0.1),
                              Color(0xff70D9D6).withOpacity(0.1)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.red,
                            labelText: "PG Image",
                            labelStyle: TextStyle(
                              fontFamily: "Noto Sans",
                              color: Color(0xFF1E5C5A),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Color(0xFF1E5C5A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff1E4746).withOpacity(0.1),
                              Color(0xff70D9D6).withOpacity(0.1)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.red,
                            labelText: "PG Name",
                            labelStyle: TextStyle(
                              fontFamily: "Noto Sans",
                              color: Color(0xFF1E5C5A),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Color(0xFF1E5C5A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    _nextButton(context),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _nextButton(BuildContext context) {
  return MaterialButton(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onPressed: () {
      HapticFeedback.vibrate();
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return InputForm();
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
              'Next',
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
