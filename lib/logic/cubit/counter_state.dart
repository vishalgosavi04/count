import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import 'counter_cubit.dart';
class counterState {
  int countervalue;
  bool? wasincremented;
  counterState({
    required this.countervalue,
    this.wasincremented,
  });
  
}