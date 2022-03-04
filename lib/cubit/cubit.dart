import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamk/cubit/states.dart';
import 'package:islamk/models/ahades.dart';
import 'package:islamk/models/azkar.dart';
import 'package:islamk/models/azkarsabah.dart';
import 'package:islamk/models/doaa.dart';
import 'package:islamk/models/kholfaa.dart';
import 'package:islamk/models/ksasAnbiaa.dart';
import 'package:islamk/models/maalomat.dart';
import 'package:islamk/models/sala.dart';
import 'package:islamk/models/tsabeh.dart';
import 'package:islamk/shared/network/dio_helper.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  late List<AhadesModel> ahadesModel = [];
  late List<DoaaModel> doaaModel = [];
  late List<AzkarModel> azkarModel = [];
  late List<KsasAnbiaaModel> ksasAnbiaaModel = [];
  late List<MaalomatModel> maalomatModel = [];
  late List<TsabehModel> tsabehModel = [];

  void getAhades(){
    if(ahadesModel == null || ahadesModel.length == 0 || ahadesModel.isEmpty){
      emit(getAhadesStateInitial());
      Dioo.getData('ahadesApi').then((value) {
        value.data.forEach((e){
          ahadesModel.add(AhadesModel.fromJson(e));
        });
        emit(getAhadesStateSuccess());
      }).catchError((e){
        print(e);
        emit(getAhadesStateError());
      });
    }
  }
  void getDoaa(){
    if(doaaModel == null || doaaModel.length == 0 || doaaModel.isEmpty){
      emit(getDoaaStateInitial());
      Dioo.getData('adayaApi').then((value) {
        value.data.forEach((e){
          doaaModel.add(DoaaModel.fromJson(e));
        });
        emit(getDoaaStateSuccess());
      }).catchError((e){
        print(e);
        emit(getDoaaStateError());
      });
    }
  }
  void getAzkar(){
    if(azkarModel == null || azkarModel.length == 0 || azkarModel.isEmpty){
      emit(getAzkarStateInitial());
      Dioo.getData('azkarApi').then((value) {
        value.data.forEach((e){
          azkarModel.add(AzkarModel.fromJson(e));
        });
        emit(getAzkarStateSuccess());
      }).catchError((e){
        print(e);
        emit(getAzkarStateError());
      });
    }
  }
  void getKsasAnbiaa(){
    if(ksasAnbiaaModel == null || ksasAnbiaaModel.length == 0 || ksasAnbiaaModel.isEmpty){
      emit(getKsasAnbiaaStateInitial());
      Dioo.getData('StoryApi').then((value) {
        value.data.forEach((e){
          ksasAnbiaaModel.add(KsasAnbiaaModel.fromJson(e));
        });
        emit(getKsasAnbiaaStateSuccess());
      }).catchError((e){
        print(e);
        emit(getKsasAnbiaaStateError());
      });
    }
  }
  void getMaalomat(){
    if(maalomatModel == null || maalomatModel.length == 0 || maalomatModel.isEmpty){
      emit(getMaalomatStateInitial());
      Dioo.getData('malomatApi').then((value) {
        value.data.forEach((e){
          maalomatModel.add(MaalomatModel.fromJson(e));
        });
        emit(getMaalomatStateSuccess());
      }).catchError((e){
        print(e);
        emit(getMaalomatStateError());
      });
    }
  }
  void getTsabeh(){
    if(tsabehModel == null || tsabehModel.length == 0 || tsabehModel.isEmpty){
      emit(getTsabehStateInitial());
      Dioo.getData('TasabyhApi').then((value) {
        value.data.forEach((e){
          tsabehModel.add(TsabehModel.fromJson(e));
        });
        emit(getTsabehStateSuccess());
      }).catchError((e){
        print(e);
        emit(getTsabehStateError());
      });
    }
  }



  ConnectivityResult? connectivityResult;
  bool isLoading = false;
  Future<void> checkConnectivityState() async {
    isLoading = true;
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.wifi) {
      isLoading = false;
      emit(ChangeButtonState());
      getAhades();
      getTsabeh();
      getMaalomat();
      getKsasAnbiaa();
      getDoaa();
      getAzkar();
      getSala();
      getAzkarMasaa();
      getAzkarSbah();
      getKholafaa();
      getadyamota();
      print('Connected to a Wi-Fi network');
    } else if (result == ConnectivityResult.mobile) {
      isLoading = false;
      emit(ChangeButtonState());
      getAhades();
      getTsabeh();
      getMaalomat();
      getKsasAnbiaa();
      getDoaa();
      getAzkar();
      getSala();
      getAzkarMasaa();
      getAzkarSbah();
      getKholafaa();
      getadyamota();
      print('Connected to a mobile network');
    } else {
      isLoading = false;
      emit(ChangeButtonState());
      print('Not connected to any network');
    }

    connectivityResult = result;
    emit(CheckConnictionSuccessState());

  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.pray.zone/v2/times/',
      receiveDataWhenStatusError: true
    ),
  );
  SalaModel? salaModel;
  void getSala(){
    emit(getTimeInitialState());
    dio.get('today.json',queryParameters: {
      'city':"cairo"
    }).then((value){
      salaModel = SalaModel.fromJson(value.data);
      emit(getTimeSuccessState());
    }).catchError((e){
      emit(getTimeErrorState());
      print(e.toString());
    });
  }

List<AzkarSbahModel> azkarSbahModel = [];
  void getAzkarSbah(){
    if(azkarSbahModel == null || azkarSbahModel.length == 0 || azkarSbahModel.isEmpty){
      emit(getAzkarsabahStateInitial());
      Dioo.getData('AzkarElsabahApi').then((value) {
        value.data.forEach((e){
          azkarSbahModel.add(AzkarSbahModel.fromJson(e));
        });
        emit(getAzkarsabahStateSuccess());
      }).catchError((e){
        print(e);
        emit(getAzkarsabahStateError());
      });
    }
  }

  List<AzkarSbahModel> azkarMsaaModel = [];
  void getAzkarMasaa(){
    if(azkarMsaaModel == null || azkarMsaaModel.length == 0 || azkarMsaaModel.isEmpty){
      emit(getAzkarMasaaStateInitial());
      Dioo.getData('azkarElmasaaApi').then((value) {
        value.data.forEach((e){
          azkarMsaaModel.add(AzkarSbahModel.fromJson(e));
        });
        emit(getAzkarMasaaStateSuccess());
      }).catchError((e){
        print(e);
        emit(getAzkarMasaaStateError());
      });
    }
  }

  List<AzkarSbahModel> adyamotaModel = [];
  void getadyamota(){
    if(adyamotaModel == null || adyamotaModel.length == 0 || adyamotaModel.isEmpty){
      emit(getAzkarsabahStateInitial());
      Dioo.getData('DeadDoaaApi').then((value) {
        value.data.forEach((e){
          adyamotaModel.add(AzkarSbahModel.fromJson(e));
        });
        emit(getAzkarsabahStateSuccess());
      }).catchError((e){
        print(e);
        emit(getAzkarsabahStateError());
      });
    }
  }

  List<KholafaaModel> kholafaaModel = [];
  void getKholafaa(){
    if(kholafaaModel == null || kholafaaModel.length == 0 || kholafaaModel.isEmpty){
      emit(getAzkarMasaaStateInitial());
      Dioo.getData('kholfaApi').then((value) {
        value.data.forEach((e){
          kholafaaModel.add(KholafaaModel.fromJson(e));
        });
        emit(getAzkarMasaaStateSuccess());
      }).catchError((e){
        print(e);
        emit(getAzkarMasaaStateError());
      });
    }
  }
}