import 'dart:convert';

import 'package:currency_converter/API/api.dart';
import 'package:currency_converter/Bloc_state_mangmet/states.dart';
import 'package:currency_converter/Error/Error.dart';
import 'package:currency_converter/Local_Data_Base/DataBase.dart';
import 'package:currency_converter/Shared_Preferences/shared_preferences.dart';
import 'package:currency_converter/Widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;


class CreateData  extends Cubit<StatesApp> {

  CreateData(super.initialState);
  static CreateData get(context) =>BlocProvider.of(context);
  final FetchData cr2 = FetchData();
  List <Map> listCrrany1 = [] ;

  void fetchData() async {
    await cr2.fetchData();
    emit(DoneFeactGetDataState());
  }
}


class  FetchData {

  final CreateDataBase CDB = CreateDataBase();
  late CurrencyApi api;

  Future<void> fetchData() async {

    await CDB.DataBaseInfo();
    var cash_helper = await Cash_Data().getData(key: "currency");

    final currencyApi = CurrencyApi(
      apiUrl: 'https://api.freecurrencyapi.com/v1/latest',
      apiKey: 'fca_live_rKuggFlZGYXHB4LPf3Xd1uGFfdpc1brmnqelV37P',
    );

    try {
      if (cash_helper ==null ) {
        Map CurrencyInfo = await currencyApi.fetchLatestRates();

        CurrencyInfo['data'].forEach((key, value) {
          CDB.ObjectInsert.insert(key, database);
          print(key);
        });
        Cash_Data().Save_Data(key: 'currency', value: true);
      }

      else {
        CDB.ObjectGetData.getdata(database);
      }

    }
    catch(e) {
      print("sdfdsf");
    }
  }
}

class CreateDataBase {

  final InsertData ObjectInsert =InsertData();
  final GetData ObjectGetData =GetData();

  Future<void> DataBaseInfo() async {
    database = await openDatabase(
        'currency.db',
        version: 1,
        onCreate: (database, version) async {
          await database.execute('CREATE TABLE CurrencyInfo (ID INTEGER PRIMARY KEY, CodeCurrency TEXT)')
              .then((value) => null)
              .catchError((e) => Tosta_mes(mess: e.toString()));
        },
        onOpen: (database)   {
          print("Done open Data");
          //await ObjectInsert.insert("mustafa salameh", database);
        }
    );


  }
}

class InsertData {
  final GetData ObjectGetData =GetData();

  Future<void> insert (String data, database) async {
    database.transaction((txn) async {
      await txn.rawQuery( 'INSERT INTO CurrencyInfo(CodeCurrency) VALUES("${data}")')
          .then((value) => null)
          .catchError((e)=> print("** ${e.toString()}*****"));
    });

    print("******************** Done Insert All Data ********************");
    await ObjectGetData.getdata(database);
  }
}

class GetData {
  getdata (database)  {
    print("Done Get Data");
    database.rawQuery('SELECT * FROM CurrencyInfo').then((value) {
      listCrrany = value;

    });
  }
}


