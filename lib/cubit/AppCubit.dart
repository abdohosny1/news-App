import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/network/cash_Helper.dart';

import 'newstate.dart';


class AppCubit extends Cubit<NewsState> {

  AppCubit() :super(AppInitiliState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark=false;

  void changeAppMode([bool? fromshared]) {
    if(fromshared !=null){
      isDark=fromshared;
      emit(AppChangeModeState());

    }else{
      isDark = !isDark;
      CashHelper.putDate(key: 'isDark', value:isDark ).then((value) {

      });

    }

  }


}