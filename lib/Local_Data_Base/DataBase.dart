import 'package:currency_converter/Global/Variable/variable.dart';
import 'package:currency_converter/Global/Widget/Widget.dart';
import 'package:sqflite/sqflite.dart';

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
  getdata(database) {
    print("Getting Data...");
    database.rawQuery('SELECT * FROM CurrencyInfo').then((value) {
      listCrrany.clear();
      listCrrany  = value.map((item) => item['CodeCurrency']).toList();
    });
  }
}