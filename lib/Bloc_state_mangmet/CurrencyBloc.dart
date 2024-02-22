import 'dart:convert';

import 'package:currency_converter/API/api.dart';
import 'package:currency_converter/Bloc_state_mangmet/states.dart';
import 'package:currency_converter/Error/Error.dart';
import 'package:currency_converter/Global/Variable/variable.dart';
import 'package:currency_converter/Local_Data_Base/DataBase.dart';
import 'package:currency_converter/Shared_Preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class Currency  extends Cubit<StatesApp> {

  Currency(super.initialState);
  static Currency get(context) =>BlocProvider.of(context);

  final FetchCurrency _fetchcurrency = FetchCurrency();
  double resultconvert =0;


  void fetchData() async {
    await _fetchcurrency.fetchData();
    await Historical ();
    emit(DoneFeactGetDataState());
  }

  Future<void> convertcurrency(String base_currency, String Currencies, Amount) async {

    final response = await http.get(Uri.parse(
        'https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_rKuggFlZGYXHB4LPf3Xd1uGFfdpc1brmnqelV37P&currencies=${Currencies}&base_currency=${base_currency}'));

    if (response.statusCode == 200) {
      Map CurrencyName =json.decode(response.body);
      resultconvert = CurrencyName['data'][Currencies] *Amount.toDouble();
      print(resultconvert);
      emit(DoneConvert());
    }

    else {
      print('Failed to load data');
      emit(ErrorConvert());
    }
  }

  Future <void> SwapCurrency () async {
    dynamic swap ;
    swap = Base_Currency;
    Base_Currency = To_Currency;
    To_Currency = swap;
    emit(DoneSwapData());
  }

  Future <void> Historical () async {

    DateTime today = DateTime.now();
    today = DateTime(today.year, today.month, today.day); // Set time to midnight
    DateTime sevenDaysAgo = today.subtract(Duration(days: 7));
    DateFormat formatter = DateFormat('yyyy-MM-dd');

    for (int i = 0; i < 7; i++) {
      DateTime dateWithoutTime =
      DateTime(sevenDaysAgo.year, sevenDaysAgo.month, sevenDaysAgo.day);
      String formattedDate = formatter.format(dateWithoutTime);
      last7Days.add(formattedDate);
      sevenDaysAgo = sevenDaysAgo.add(Duration(days: 1));
    }

    final currencyApi = CurrencyApi(
      apiUrl: 'https://api.freecurrencyapi.com/v1/historical',
      apiKey: 'fca_live_rKuggFlZGYXHB4LPf3Xd1uGFfdpc1brmnqelV37P',
    );

    try {
      Map DatatHistorical = await currencyApi.fetchHistoricalRateRates(last7Days.first);
      HistoricalRate = DatatHistorical['data'][last7Days.last]["AUD"];
    }
    catch(e){
      print("${e} *********************");
      ErrorHandler(e.toString());
    }


    emit(DoneHistorical());

  }
}

class  FetchCurrency {
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
        });
        Cash_Data().Save_Data(key: 'currency', value: true);
      }

      else {
        CDB.ObjectGetData.getdata(database);
      }

    }
    catch(e) {
      print("Done");
      ErrorHandler(e.toString());
    }
  }
}





