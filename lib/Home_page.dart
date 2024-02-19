import 'package:currency_converter/Bloc_state_mangmet/bloc_class.dart';
import 'package:currency_converter/Bloc_state_mangmet/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override


  Widget build(BuildContext context) {
    return   BlocProvider(
        create: (context)=>StateMangment(InitialState())..fetchDatapost(),
        child: BlocConsumer<StateMangment , StatesApp> (
          listener: (context , state) {},
          builder : (context , state) {
            return  Scaffold(
              body: Center(
                child: TextButton(
                    onPressed: () {
                    },
                    child: Text("Insert data")),
              ),
            );
          } ,
        )
    );
  }
}
