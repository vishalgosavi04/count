import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';
class  counterCubit extends Cubit<counterState>{
  counterCubit(): super(counterState(countervalue: 0));

  void incremented()=> emit(counterState(countervalue: state.countervalue+1 ,wasincremented: true));
  void decremented()=>emit(counterState(countervalue: state.countervalue-1, wasincremented: false));
} 