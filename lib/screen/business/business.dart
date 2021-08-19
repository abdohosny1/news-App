
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/newscupit.dart';
import 'package:newsapp/cubit/newstate.dart';
import 'package:newsapp/network/const.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCupit,NewsState>(
        listener: (context,state){},
        builder: (context,state){
          var list=NewsCupit.get(context).business;
          return  ScreenTypeLayout(
            mobile: Builder(
              builder: (context){
                NewsCupit.get(context).setDesktop(false);
                return articalBulider(list,context);
              },
            ),
            desktop: Builder(
              builder: (context){
                NewsCupit.get(context).setDesktop(true);
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container(child: articalBulider(list,context),)),
                    if(list.length>0)
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          color: Colors.grey[200],
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              '${list[NewsCupit.get(context).selsecteditem]['description']}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      )],
                );
              },
            ),
            breakpoints: ScreenBreakpoints(
              desktop: 650,
              watch: 100,
              tablet: 600,
            ),
          );
        }
    );

  }
}

