import 'package:flutter/material.dart';

class Backdrop extends StatelessWidget {
  const Backdrop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/bg.png"),
        ),
      ),
    );
  }
}
