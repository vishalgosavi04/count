import 'package:flutter/material.dart';
import 'package:counterapp/logic/cubit/counter_cubit.dart';
import 'package:counterapp/logic/cubit/counter_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class secondscreen extends StatefulWidget {
  
  const secondscreen({super.key, required this.title,required this.color});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final Color color;
  @override
  State<secondscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<counterCubit,counterState>(
                listener: (context, state) => {
                    if(state.wasincremented==true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Incremented"),duration: Duration(milliseconds: 200))
                     ),
                    }
                    else if(state.wasincremented==false){
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Decremented"),duration: Duration(milliseconds: 200),)
                    )
                    } 
                },
                builder: (context,state) {
                  return Text(
                    state.countervalue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              ),
      
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                      onPressed: (){
                        BlocProvider.of<counterCubit>(context).incremented();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                      onPressed: (){
                        BlocProvider.of<counterCubit>(context).decremented();
                      },
                      tooltip: 'decrement',
                      child: const Icon(Icons.remove),
                  ),
                ],
              )
            ],
          ),
        ),
      );
  }
}
