import 'dart:convert';
import 'package:currency_converter/Bloc_state_mangmet/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

Database?database;
Map  data = {};

class StateMangment extends Cubit<StatesApp> {

  StateMangment(super.initialState);
  static StateMangment get(context) =>BlocProvider.of(context);

  Database?database;
  Map  data = {};

  Future<void> fetchDatapost() async {
    final response = await http.get(Uri.parse('https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_rKuggFlZGYXHB4LPf3Xd1uGFfdpc1brmnqelV37P'));
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      data["data"].forEach((key, value) => print(key) );

    } else {
      print('Failed to load data');
    }
  }
}


class CreateData extends StateMangment {

  CreateData(super.initialState);
  static CreateData get(context) =>BlocProvider.of(context);

  void CreateDataBase() async {
    database = await openDatabase(
        'currency.db',
        version: 1,
        onCreate: (database , version ) async {
          await database.execute(
              'CREATE TABLE CurrencyInfo (ID INTEGER PRIMARY KEY, CodeCurrency TEXT)')
              .then((value) {
            print("Done Create Table");
            emit(DoneCreateTable());
          })
              .catchError((e){

            print("Error Create Table ${e.toString()}");
            emit(ErrorCreateTable());
          });
        },

        onOpen: (database) {
          print("Open DataBase");
        }
    );
  }

}

class InsertData {
}

class GetData {}

