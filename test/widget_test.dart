import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/API/api.dart';
import 'package:currency_converter/Bloc_state_mangmet/CurrencyBloc.dart';
import 'package:currency_converter/Global/Variable/variable.dart';
import 'package:currency_converter/Bloc_state_mangmet/states.dart';

void main() {
  final Currency currency = Currency(InitialState());

  test('Convert Function test', () async {
    final currencyconvertApi = CurrencyApi(
      apiUrl: 'https://api.freecurrencyapi.com/v1/latest',
      apiKey: 'fca_live_rKuggFlZGYXHB4LPf3Xd1uGFfdpc1brmnqelV37P',
    );

    await testCurrencyConversion(currency, currencyconvertApi, "USD", "AUD", 4);
    await testCurrencyConversion(currency, currencyconvertApi, "BRL", "CHF", 125.8);
    await testCurrencyConversion(currency, currencyconvertApi, "TRY", "DKK", 0.4);
    await testCurrencyConversion(currency, currencyconvertApi, "TRY", "DKK", 0.4);
  });

  test("Switch between the two currencies Function Test ", () async {
    testCurrencySwap(currency, "BRL", "CFH");
    testCurrencySwap(currency, "ZAR", "CAD");
    testCurrencySwap(currency, "CNY", "DKK");
    testCurrencySwap(currency, "EUR", "GBP");
  });
}


Future<void> testCurrencyConversion(Currency currency, CurrencyApi currencyconvertApi, String baseCurrency, String targetCurrency, double amount) async {
  final currencyData = await currencyconvertApi.ConvertCurrancyApi(baseCurrency, targetCurrency);
  final expectedValue = currencyData['data'][targetCurrency];
  await currency.convertcurrency(baseCurrency, targetCurrency, amount);
  expect(currency.resultconvert, expectedValue * amount);
}

void testCurrencySwap(Currency currency, String baseCurrency, String targetCurrency) {
  currency.SwapCurrency(baseCurrency, targetCurrency);
  expect(Base_Currency, targetCurrency);
  expect(To_Currency, baseCurrency);
}
