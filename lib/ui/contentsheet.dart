import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yehlo/ui/signinbutton.dart';

class ContentSheet extends StatelessWidget {
  const ContentSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
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
                alignment: Alignment.topCenter,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "Berkshire Swash",
                    fontSize: 58,
                    color: Color(0xFF1E4746),
                  ),
                ),
              ),
              SignInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
