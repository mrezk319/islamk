import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:islamk/cubit/cubit.dart';
import 'package:islamk/cubit/states.dart';
import 'package:islamk/widgets/azanitem.dart';

class AzanScreen extends StatelessWidget {
  const AzanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AppCubit>(context),
      child: BlocConsumer<AppCubit, AppState>(
          builder: (context, state) => Scaffold(
                extendBodyBehindAppBar: true,
                // appBar: AppBar(
                //   leading: Text(""),
                //   backgroundColor: Colors.transparent,
                //   elevation: 0,
                //   // backgroundColor: HexColor('#3a8695'),
                //   title: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(""),
                //     ],
                //   ),
                // ),
                body: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/azaan.jpg'),
                    fit: BoxFit.fitHeight,
                  )),
                  child: ListView(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,right: 18,top: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.rtl,
                            children: [
                              Padding(
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
                                                AppCubit.get(context)
                                                        .salaModel!
                                                        .results!
                                                        .location!
                                                        .city == "Cairo"?" القاهرة":"",
                                                style: TextStyle(
                                                    fontFamily: "MyFont",
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              textDirection: TextDirection.rtl,
                                            ),
                                            Text("المدينة الحالية :",
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
                                  decoration: const BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
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
                                              AppCubit.get(context)
                                                  .salaModel!
                                                  .results!
                                                  .datetime![0].date!.gregorian.toString(),
                                              style: TextStyle(
                                                  // fontFamily: "MyFont",
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              textDirection: TextDirection.rtl,
                                            ),
                                            Text(" تاريخ اليوم الميلادي :",
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
                                        const SizedBox(height: 15),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppCubit.get(context)
                                                  .salaModel!
                                                  .results!
                                                  .datetime![0].date!.hijri.toString(),
                                              style: TextStyle(
                                                  // fontFamily: "MyFont",
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              textDirection: TextDirection.rtl,
                                            ),
                                            Text(" تاريخ اليوم الهجري :",
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
                                  decoration: const BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                ),
                              ),
                              const SizedBox(height: 5),
                              AzanItem(AppCubit.get(context).salaModel!.results!.datetime![0].times!.fajr??"","الفجر"),
                              AzanItem(AppCubit.get(context).salaModel!.results!.datetime![0].times!.sunrise??"","الشروق"),
                              AzanItem(AppCubit.get(context).salaModel!.results!.datetime![0].times!.dhuhr??"","الظهر"),
                              AzanItem(AppCubit.get(context).salaModel!.results!.datetime![0].times!.asr??"","العصر"),
                              AzanItem(AppCubit.get(context).salaModel!.results!.datetime![0].times!.maghrib??"","المغرب"),
                              AzanItem(AppCubit.get(context).salaModel!.results!.datetime![0].times!.isha??"","العشاء"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          listener: (context, state) {}),
    );
  }
}
