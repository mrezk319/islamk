import 'package:flutter/material.dart';
import 'package:islamk/models/home.dart';

class HomeItem extends StatelessWidget {
  HomeModel? home;

  HomeItem(this.home);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 10),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ClipRRect(
          //   child: ,
          //   borderRadius:const BorderRadius.all(Radius.circular(100)),
          // ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/${home!.img}'),
            radius: 50,
          ),
         const SizedBox(
            height: 7,
          ),
          Text("${home!.name}",
              style:const TextStyle(
                  fontFamily: "MyFont",
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
        ],
      ),
    );
  }
}
