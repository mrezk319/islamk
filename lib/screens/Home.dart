import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamk/cubit/cubit.dart';
import 'package:islamk/cubit/states.dart';
import 'package:islamk/models/home.dart';
import 'package:islamk/screens/Index.dart';
import 'package:islamk/screens/adyamota.dart';
import 'package:islamk/screens/ahades.dart';
import 'package:islamk/screens/azan.dart';
import 'package:islamk/screens/azkaar.dart';
import 'package:islamk/screens/azkarmasaa.dart';
import 'package:islamk/screens/azkarsabah.dart';
import 'package:islamk/screens/doaa.dart';
import 'package:islamk/screens/ksasAnbyaa.dart';
import 'package:islamk/screens/ksaskholafaa.dart';
import 'package:islamk/screens/maalomat.dart';
import 'package:islamk/screens/tsabeh.dart';
import 'package:islamk/widgets/draweitem.dart';
import 'package:islamk/widgets/home_item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_button/loading_button.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
    return BlocProvider.value(
      value: BlocProvider.of<AppCubit>(context),
      child: BlocConsumer<AppCubit, AppState>(
          builder: (context, state) =>
          (AppCubit
              .get(context)
              .connectivityResult ==
              ConnectivityResult.none &&
              AppCubit
                  .get(context)
                  .maalomatModel
                  .isEmpty)
              ? Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/no.jpg',
                  width: double.infinity,
                ),
                LoadingButton(
                  onPressed:
                  AppCubit
                      .get(context)
                      .checkConnectivityState,
                  isLoading: false,
                  loadingWidget: SizedBox(
                    width: 25,
                    height: 25,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white),
                      ),
                    ),
                  ),
                  child: Text(
                    "Try again",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
              :Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  toolbarHeight: 100,
                  elevation: 0,
                  // backgroundColor: HexColor('#3a8695'),
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: Column(
                    children: [
                      SizedBox(height: 5),
                      Text("إسلامك", style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "MyFont",
                          fontSize: 25)),
                    ],
                  ),
                  actions: [

                  ],
                  leading: Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Image.asset('assets/images/men.png',fit: BoxFit.fitWidth),
                          ),
                          onTap: ()
                      {
                        Scaffold.of(context).openDrawer();
                      },
                      );
                    },
                  ),
                ),
                body:  Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/back.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: (AppCubit
                      .get(context)
                      .maalomatModel
                      .isEmpty || AppCubit
                      .get(context)
                      .salaModel == null) ? Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                          color: HexColor('#3a8695'),
                          size: 50
                      )) : AnimationLimiter(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(seconds: 1),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: ScaleAnimation(
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: InkWell(
                                    child: HomeItem(list[index]),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .fade,
                                              duration: Duration(
                                                  milliseconds: 600),
                                              child:
                                              listWidget[index]));
                                    }),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ), /* add child content here */
                ),

                drawer: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100)),
                  child: Drawer(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/back.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Image.asset('assets/images/is.jpg'),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60,right: 18,left: 18),
                          child: ListView.separated(separatorBuilder: (context,index)=>SizedBox(height: 35),shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) => InkWell(
                              child: DrawerItem(drawerItem[index]),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType
                                            .fade,
                                        duration: Duration(
                                            milliseconds: 600),
                                        child:
                                        screens[index]));
                              }),itemCount: drawerItem.length),
                        ),

                      ),
                    ),

                  ),),
              ),
          listener: (context, state) {
            // (AppCubit.get(context).connectionStatus == ConnectivityResult.none)?
            // EasyLoading.showError('برجاء الأتصال بالأنترنت وإعادة المحاولة'):SizedBox();
          }),
    );
  }
}

List<HomeModel> list = [
  HomeModel("logo.png", "القرأن الكريم"),
  HomeModel("ahades.png", "أحاديث نبوية"),
  HomeModel("doaa.jpg", "أدعية"),
  HomeModel("ksasan.jpg", "قصص الأنبياء"),
  HomeModel("azkar.png", "أذكار"),
  HomeModel("malomat.jpg", "معلومات إسلامية"),
  HomeModel("s.jpg", "تسابيح"),
  HomeModel("azan.jpg", "مواعيد الأذان"),
];

List<Widget> listWidget = [
  Index(),
  AhadesScreen(),
  DoaaScreen(),
  KsasAnbyaaScreen(),
  AzkarScreen(),
  MaalomatScreen(),
  TsabehScreen(),
  AzanScreen()
];
List<String> drawerItem = [
  "أذكار الصباح",
  "أذكار المساء",
  "أدعية للموتي",
  "قصص الخلفاء",

];
List<Widget> screens=[
  AzkarSabahScreen(),
  AzkarMasaaScreen(),
  AdyaMotaScreen(),
  KsasKholafaaScreen(),
];