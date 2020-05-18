import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButtonDisabled extends StatelessWidget {
  const SubmitButtonDisabled({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: Center(
        child: MaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: null,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          highlightElevation: 0,
          padding: EdgeInsets.all(20),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffd4d4d4), Color(0xffd4d4d4)],
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
                      color: Color(0xFF777777),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Color(0xFF777777),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        // child: Text(
        //   "Submit",
        //   style: TextStyle(
        //       fontFamily: "Noto Sans",
        //       color: Colors.grey,
        //       fontSize: 20),
        // ),
      ),
    );
  }
}
