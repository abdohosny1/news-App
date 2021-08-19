import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/newscupit.dart';
import 'package:newsapp/cubit/newstate.dart';
import 'package:newsapp/network/const.dart';
class Search extends StatelessWidget {

var serchcontroler=TextEditingController();
var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCupit,NewsState>(
        listener:(context,state){} ,
        builder: (context,state){
          var list=NewsCupit.get(context).searchlist;
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      //style: TextStyle(color: Colors.blue),

                      controller: serchcontroler,
                      validator: (v){
                        if(v!.isEmpty){
                          return 'Serach must not be empty';
                        }
                        return null;
                      },
                      onChanged: (value){
                        NewsCupit.get(context).getsearch(value);

                      },
                      decoration: InputDecoration(

                        prefix: Icon(Icons.search_rounded),
                        labelText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),

                      ),
                    ),

                  ),
                  Expanded(
                      child: articalBulider(list,context,isserch: true))


                ],
              ),
            ),
          );
        });
  }
}

