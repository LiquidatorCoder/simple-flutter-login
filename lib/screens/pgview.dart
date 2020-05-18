import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PGView extends StatelessWidget {
  String url;
  PGView(this.url);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: this.url,
      child: Container(
          child: PhotoView(
        backgroundDecoration: BoxDecoration(color: Colors.transparent),
        tightMode: true,
        imageProvider: NetworkImage(this.url),
      )),
    );
  }
}
