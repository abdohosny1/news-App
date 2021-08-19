import 'package:newsapp/cubit/AppCubit.dart';
import 'package:newsapp/screen/srearch/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/newscupit.dart';
import 'package:newsapp/cubit/newstate.dart';
import 'package:newsapp/network/const.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCupit,NewsState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=NewsCupit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (e)=>Search()));
                //  navigatTo(Search(),context);
                }, icon: Icon(Icons.search_rounded)),
                IconButton(onPressed: (){
                  AppCubit.get(context).changeAppMode();
                }, icon: Icon(Icons.brightness_4_outlined)),
              ],
            ),


              bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomitem,
                currentIndex: cubit.indexcount,
                onTap: (t){
                  cubit.showindex(t);

                },
              ),
            body:cubit.list[cubit.indexcount] ,

          );
        },


    );
  }
}
