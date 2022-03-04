import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  String? name;
  DrawerItem(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.white10,
        // borderRadius: BorderRadius.all(
        //     Radius.circular(50)),
        border: Border(
          right: BorderSide(width: 7.0, color: Colors.lightBlue.shade900),
          left: BorderSide(width: 7.0, color: Colors.lightBlue.shade900),
          top: BorderSide(width: 7.0, color: Colors.lightBlue.shade50),
          bottom: BorderSide(width: 7.0, color: Colors.lightBlue.shade900),),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${this.name}",
              style: TextStyle(
                  fontFamily: "MyFont",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}
