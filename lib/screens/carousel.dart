import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yehlo/screens/input_form.dart';
import 'package:yehlo/screens/sign_in.dart';
import 'package:yehlo/ui/contenttile.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.add,
          color: Color(0xFF1E5C5A),
        ),
        label: Text(
          "Add",
          style: TextStyle(
            color: Color(0xFF1E5C5A),
            fontFamily: "Noto Sans",
          ),
        ),
        backgroundColor: Color(0xff70D9D6),
        elevation: 10,
        disabledElevation: 0,
        focusElevation: 2,
        highlightElevation: 2,
        hoverElevation: 2,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return InputForm();
              },
            ),
          );
        },
      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: CircleAvatar(
                            minRadius: 25,
                            backgroundImage: NetworkImage(imageUrl),
                            backgroundColor: Color(0xFF1E4746),
                          ),
                        )
                      ],
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
                                    return ContentTile(
                                      names: names,
                                      locations: locations,
                                      images: images,
                                      index: index,
                                    );
                                  },
                                ),
                              ),
                            );
                          } else {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Color(0xFF1E5C5A)),
                                ),
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
