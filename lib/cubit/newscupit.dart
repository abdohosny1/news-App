
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/network/dio_helper.dart';
import 'package:newsapp/screen/business/business.dart';
import 'package:newsapp/screen/science/science.dart';
import 'package:newsapp/screen/sports/sports.dart';

import 'newstate.dart';


class NewsCupit extends Cubit<NewsState>{

  NewsCupit() :super(AppInitiliState());

  static NewsCupit get(context)=>BlocProvider.of(context);

  int indexcount=0;
  var list=[
    Business(),
    Sports(),
    Science(),
  ];

  List <BottomNavigationBarItem> bottomitem=[
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
  ];

  void showindex(int index){
    indexcount=index;
    if(index==1){
      getSports();
    }else if(index==2){
      getScience();
    }
    emit(AppBottomNaveState());
  }

  List<dynamic> business=[];
   int selsecteditem=0;
   bool isDesktop=false;

   void setDesktop(bool value){
     isDesktop=value;
     emit(AppSetSetSDesktopState());
   }
 // List<bool> businessselected=[];

  void getBusiness(){
    emit(AppBussinessLoadingState());
    DioHelpper.getData(
        url: 'v2/top-headlines',
        quary: {'country' : 'eg',
          'category':'business',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'}

    ).then((value) {
    //  print(value.data['totalResults'].toString());
      business=value.data['articles'];
      // business.forEach((element) {
      //   businessselected.add(false);
      // });
      print(business[0]['title']);
      emit(AppGetBusinessSucess());
    }).catchError((e){
      print(e.toString());
      emit(AppGetBusinessError(e.toString()));
    });

  }

  void businesSelected(index){
   // businessselected[index]=true;

    // for(int i =0;i< businessselected.length ; i++){
    //   if(i==index){
    //     businessselected[i]=true;
    //   }else {
    //     businessselected[i]=false
    //     ;
    //
    //   }
    // }
    selsecteditem=index;

    emit(AppSelectedItemState());
  }

  List<dynamic> sports=[];

  void getSports(){
    emit(AppSportsLoadingState());
    if(sports.length==0){
      DioHelpper.getData(
          url: 'v2/top-headlines',
          quary: {'country' : 'eg',
            'category':'sports',
            'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'}

      ).then((value) {
        //  print(value.data['totalResults'].toString());
        sports=value.data['articles'];
        print(sports[0]['title']);
        emit(AppGetSportsSucess());
      }).catchError((e){
        print(e.toString());
        emit(AppGetSportsError(e.toString()));
      });
    }else {
      emit(AppGetSportsSucess());

    }


  }

  List<dynamic> science=[];

  void getScience(){
    emit(AppScienceLoadingState());
    if(science.length==0){
      DioHelpper.getData(
          url: 'v2/top-headlines',
          quary: {'country' : 'eg',
            'category':'science',
            'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'}

      ).then((value) {
        //  print(value.data['totalResults'].toString());
        science=value.data['articles'];
        print(science[0]['title']);
        emit(AppGetScienceSucess());
      }).catchError((e){
        print(e.toString());
        emit(AppGetScienceError(e.toString()));
      });
    }else{
      emit(AppGetScienceSucess());

    }


  }

  List<dynamic> searchlist=[];

  void getsearch(String value){

    emit(AppSearchLoadingState());
    searchlist=[];


      DioHelpper.getData(
          url: 'v2/everything',
          quary: {

            'q':'${value}',
            'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'}

      ).then((value) {
        //  print(value.data['totalResults'].toString());
        searchlist=value.data['articles'];
        print(searchlist[0]['title']);
        emit(AppGetSearchSucess());
      }).catchError((e){
        print(e.toString());
        emit(AppGetSearchError(e.toString()));
      });


  }


}