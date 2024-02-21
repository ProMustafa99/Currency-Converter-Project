import 'dart:convert';
import 'package:currency_converter/Error/Error.dart';
import 'package:currency_converter/Local_Data_Base/DataBase.dart';
import 'package:currency_converter/Shared_Preferences/shared_preferences.dart';
import 'package:currency_converter/Widget.dart';
import 'package:http/http.dart' as http;





class CurrencyApi {
  final String apiUrl;
  final String apiKey;

  CurrencyApi({required this.apiUrl, required this.apiKey});

  Future<Map<String, dynamic>> fetchLatestRates() async {
    final response = await http.get(Uri.parse('$apiUrl?apikey=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load latest currency rates');
    }
  }
}

class FlagApi {
  final String apiUrl;

  FlagApi({required this.apiUrl});

  Future<Map<String, dynamic>> fetchCountryFlags() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load country flags');
    }
  }
}

// class DataFetcher {
//   final CreateDataBase createdatabase = CreateDataBase();
//   final InsertDate insert = InsertDate();
//   final GetData getData =GetData();
//
//
//   Future<void> fetchData() async {
//
//     createdatabase.DataBaseInfo();
//     var cash_helper = await Cash_Data().getData(key: "currency");
//
//     print("************************* ${cash_helper} ********************* ");
//
//     if (cash_helper ==null) {
//       final currencyApi = CurrencyApi(
//         apiUrl: 'https://api.freecurrencyapi.com/v1/latest',
//         apiKey: 'fca_live_rKuggFlZGYXHB4LPf3Xd1uGFfdpc1brmnqelV37P',
//       );
//
//       try {
//         Map CurrencyInfo = await currencyApi.fetchLatestRates();
//         CurrencyInfo['data'].forEach((key, value) async {
//          await  insert.insertdata(key,createdatabase.database);
//         });
//         Cash_Data().Save_Data(key: 'currency', value: true);
//       }
//       catch (e) {ErrorHandler(e.toString());}
//     }
//
//     else  {
//       createdatabase.DataBaseInfo().then((value) => null);
//         // getData.getdata(createdatabase.database);
//     }
//
//   }
// }
