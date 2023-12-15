import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counterapp/constants/enums.dart';
import 'package:flutter/material.dart';

abstract class internet_state{}

class internetloading extends internet_state{}

class internetconnected extends internet_state{
  final connectionType connectiontype;
  internetconnected({required this.connectiontype});
}

class internetdisconnected extends internet_state{}