import 'package:currency_converter/Bloc_state_mangmet/bloc_class.dart';
import 'package:currency_converter/Bloc_state_mangmet/states.dart';
import 'package:currency_converter/Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  Widget build(BuildContext context) {
    return   BlocProvider(
        create: (context)=>CreateData(InitialState())..fetchData(),

        child: BlocConsumer<CreateData , StatesApp> (
          listener: (context , state) async {},
          builder : (context , state) {
            return  Scaffold(
              body: ListView.builder(
                itemCount: listCrrany.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${listCrrany[index]["CodeCurrency"]}"),
                  );
                },
              ),
            );
          } ,
        )
    );
  }
}
