import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentTile extends StatelessWidget {
  const ContentTile({
    Key key,
    @required this.names,
    @required this.locations,
    @required this.images,
    @required this.index,
  }) : super(key: key);

  final List names;
  final List locations;
  final List images;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
          color: Color(0xFFF2F2F2),
          borderRadius: BorderRadius.all(
            Radius.circular(35),
          ),
        ),
        child: SizedBox(
          height: 300.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 120.h,
                    width: 350.w,
                    child: ListTile(
                      leading: Icon(
                        Icons.location_city,
                        color: Color(0xFF1E5C5A),
                      ),
                      title: Text(
                        names[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Noto Sans",
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E5C5A),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 110.h,
                    width: 350.w,
                    child: ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Color(0xFF1E5C5A),
                      ),
                      title: Text(
                        locations[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Noto Sans",
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E5C5A),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(
                        images[index],
                      ),
                      fit: BoxFit.cover),
                ),
                child: SizedBox(
                  height: 300.h,
                  width: 300.w,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
