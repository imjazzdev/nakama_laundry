import 'package:flutter/material.dart';

class OkeBottomNav extends StatelessWidget {
  final String txt;

  OkeBottomNav({this.txt = 'OKE'});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 200,
        child: Text(
          txt,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue),
      ),
    );
  }
}
