import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/newscupit.dart';
import 'package:newsapp/cubit/newstate.dart';
import 'package:newsapp/network/const.dart';
class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCupit,NewsState>(
        listener: (context,state){},
        builder: (context,state){
          var list=NewsCupit.get(context).sports;
          return articalBulider(list,context);
        }
    );

  }
}

