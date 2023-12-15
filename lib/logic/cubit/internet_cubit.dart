import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counterapp/constants/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internet_state.dart';
class internetCubit extends Cubit<internet_state>{
  final Connectivity connectivity;
  
  internetCubit({required this.connectivity}) : super(internetloading()){
    monitorinternetsubscription();
  }

  StreamSubscription<ConnectivityResult> monitorinternetsubscription() {
    return connectivitysubscription = connectivity.onConnectivityChanged.listen((connectivityResult) {
      if(connectivityResult== ConnectivityResult.wifi){
        emitinternetconnected(connectionType.wifi);
      }
      else if(connectivityResult==  ConnectivityResult.mobile){
        emitinternetconnected(connectionType.mobile);
      }
      else if(connectivityResult == ConnectivityResult.none){
        emitinternetdisconnected();
      }

   });
  }
  late StreamSubscription connectivitysubscription;
  void emitinternetconnected(connectionType _connectiontype) => emit(internetconnected(connectiontype: _connectiontype));
  void emitinternetdisconnected()=> emit(internetdisconnected());
}