import 'package:flutter/material.dart';
import 'package:islamk/cubit/cubit.dart';

class AzanItem extends StatelessWidget {
  String? name,time;
  AzanItem(this.time,this.name);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    time??"",
                    style: TextStyle(
                        // fontFamily: "MyFont",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    textDirection: TextDirection.rtl,
                  ),
                  Spacer(),
                  Text(" صلاة ${name} :",
                    style: TextStyle(
                        fontFamily: "MyFont",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ],
          ),
        ),
        decoration:  BoxDecoration(
          color: Colors.white10,
          // borderRadius: BorderRadius.all(
          //     Radius.circular(50)),
          border: Border(
            top: BorderSide(width: 7.0, color: Colors.lightBlue.shade50),
            bottom: BorderSide(width: 7.0, color: Colors.lightBlue.shade900),),
        ),
      ),
    );
  }
}
