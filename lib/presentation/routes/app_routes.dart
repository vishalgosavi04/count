import 'package:counterapp/logic/cubit/counter_cubit.dart';
import 'package:counterapp/presentation/screens/firstscreen.dart';
import 'package:counterapp/presentation/screens/secondscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Approute{
  final counterCubit _countercubit = counterCubit();
  Route? ongenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name) {
      case '/':
          return MaterialPageRoute(
            builder: (_)=> BlocProvider.value(
              value: _countercubit,
              child: firstscreeen(title: "first screen", color: Colors.blueAccent,),
              ) );
          break;
      case '/second': 
          return MaterialPageRoute(
            builder: (_)=> BlocProvider.value(
              value: _countercubit,
              child: secondscreen(title: "second screen", color: Colors.redAccent,),
              ));
          break;
      default:
      return null;
    }
  }
  void dispose(){
    _countercubit.close();
  }
}