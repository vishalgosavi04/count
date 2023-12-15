import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counterapp/logic/cubit/counter_cubit.dart';
import 'package:counterapp/logic/cubit/internet_cubit.dart';
import 'package:counterapp/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counterapp/logic/cubit/counter_state.dart';
import 'package:counterapp/presentation/screens/firstscreen.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Approute _approute = Approute();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<counterCubit>(
          create: (context) => counterCubit(),
          child:MaterialApp(
        onGenerateRoute: _approute.ongenerateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        ),
    );
  }
  @override
  void dispose(){
    _approute.dispose();
  }
}

