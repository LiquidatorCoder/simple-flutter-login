import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yehlo/screens/sign_in.dart';
import 'dart:io';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final databaseReference2 = Firestore.instance;
  Future<QuerySnapshot> dbr;
  List data = [];
  List images = [];
  List names = [];
  List locations = [];
  @override
  void initState() {
    super.initState();
    dbr = databaseReference2.collection("users").getDocuments();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                image: AssetImage("assets/bg2.png"),
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
                height: 1340.h,
                width: 720.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "PGs",
                          style: TextStyle(
                            fontFamily: "Berkshire Swash",
                            fontSize: 58,
                            color: Color(0xFF1E4746),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 720.w,
                      height: 1135.h,
                      child: new FutureBuilder(
                        future: dbr,
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            data = [];
                            images = [];
                            names = [];
                            locations = [];
                            snapshot.data.documents
                                .forEach((element) => data.add(element.data));
                            snapshot.data.documents.forEach((element) =>
                                images.add(element.data["pgImage"]));
                            snapshot.data.documents.forEach(
                                (element) => names.add(element.data["pgName"]));
                            snapshot.data.documents.forEach((element) =>
                                locations.add(element.data["pgLocation"]));

                            return Container(
                              child: new Scrollbar(
                                child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.1),
                                              spreadRadius: 3,
                                              blurRadius: 10,
                                              offset: Offset(0,
                                                  4), // changes position of shadow
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 120.h,
                                                    width: 350.w,
                                                    child: ListTile(
                                                      leading: Icon(
                                                        Icons.location_city,
                                                        color:
                                                            Color(0xFF1E5C5A),
                                                      ),
                                                      title: Text(
                                                        names[index],
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily:
                                                              "Noto Sans",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xFF1E5C5A),
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
                                                        color:
                                                            Color(0xFF1E5C5A),
                                                      ),
                                                      title: Text(
                                                        locations[index],
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily:
                                                              "Noto Sans",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xFF1E5C5A),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(35),
                                                  ),
                                                  image: DecorationImage(
                                                      image: FileImage(
                                                        new File(images[index]),
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
                                  },
                                ),
                              ),
                            );
                          } else {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(),
                              ],
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
