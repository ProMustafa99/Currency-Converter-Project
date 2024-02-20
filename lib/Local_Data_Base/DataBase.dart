import 'package:currency_converter/Widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';




class CreateDataBase {
  late Database database;
  Future<void> DataBaseInfo() async {
    database = await openDatabase(
        'currency.db',
         version: 1,
         onCreate: (database, version) async {
         await database
          .execute('CREATE TABLE CurrencyInfo (ID INTEGER PRIMARY KEY, CodeCurrency TEXT)')
          .then((value) => null)
          .catchError((e) => Tosta_mes(mess: e.toString()));
        },
        onOpen: (database) => print("Open DataBase ")
    );
  }
}

class InsertDate extends CreateDataBase {

  Future <void> insertdata (String CodeCurrency , Object_Form_DataBase) async {
    Object_Form_DataBase.transaction((txn) async {
      await txn.rawQuery( 'INSERT INTO CurrencyInfo(CodeCurrency) VALUES("${CodeCurrency}")')
          .then((value)  => print("Insert Data $CodeCurrency"))
          .catchError((e)=> print("** ${e.toString()}*****"));
    });
  }
}

class GetData {
  Future <void> getdata (database)  async {
     await database.rawQuery('SELECT * FROM CurrencyInfo')
         .then((value) => listCrrany = value);
  }

}
