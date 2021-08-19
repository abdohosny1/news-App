import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:newsapp/screen/home.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/cubit/newscupit.dart';
import 'package:newsapp/cubit/newstate.dart';
import 'package:newsapp/network/const.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'cubit/AppCubit.dart';
import 'cubit/bloc_observe.dart';
import 'network/cash_Helper.dart';
import 'network/dio_helper.dart';

void main()async {
  //run web with command
  //flutter run -d chrome --web-renderer html

  WidgetsFlutterBinding.ensureInitialized();
 // if(Platform.isWindows)
   // await DesktopWindow.setMinWindowSize(Size(300.0,650.0));
  Bloc.observer = MyBlocObserver();
  DioHelpper.init();
  await CashHelper.init();
  //bool? isDark=CashHelper.getDate(key: 'isDark');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // boo?l isdark;
  // MyApp(this.isdark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (cntxet) =>NewsCupit()..getBusiness()..getSports()..getScience()),
        BlocProvider(create: (BuildContext context) => AppCubit()..changeAppMode()),
      ],

      child: BlocConsumer<NewsCupit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  color: Colors.white,
                  elevation: 0,
                  backwardsCompatibility: false,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.black, size: 30),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.white,
                  elevation: 30,
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ))),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: HexColor('333739'),
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  color: HexColor('333739'),
                  elevation: 0,
                  backwardsCompatibility: false,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.white, size: 30),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: HexColor('333739'),
                  elevation: 30,
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ))),
            themeMode:ThemeMode.light,
            //AppCubit.get(context).isDark ?ThemeMode.dark:ThemeMode.light,
            home:
            // ScreenTypeLayout(
            //   mobile: Home(),
            //   desktop: Text('Desktop'),
            //   breakpoints: ScreenBreakpoints(
            //     desktop: 600,
            //     tablet: 300,
            //     watch: 300
            //   ),
           // ),

            Directionality(textDirection: TextDirection.rtl, child: Home()),
            debugShowCheckedModeBanner: false,
          );
        },
      ),

    );
  }
}
