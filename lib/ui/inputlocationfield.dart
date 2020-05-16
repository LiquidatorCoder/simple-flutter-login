import 'package:location/location.dart';
import 'package:flutter/material.dart';

class InputLocationField extends StatelessWidget {
  const InputLocationField({
    Key key,
    @required this.islocation,
    @required LocationData locationData,
  })  : _locationData = locationData,
        super(key: key);

  final bool islocation;
  final LocationData _locationData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
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
          enabled: false,
          decoration: InputDecoration(
            fillColor: Colors.red,
            labelText: islocation
                ? "Lat : ${_locationData.latitude}, Long : ${_locationData.longitude}"
                : "PG Location",
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
              Icons.location_on,
              color: Color(0xFF1E5C5A),
            ),
          ),
        ),
      ),
    );
  }
}
