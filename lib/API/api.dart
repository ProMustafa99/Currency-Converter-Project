import 'dart:convert';
import 'package:currency_converter/Error/Error.dart';
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
      HttpError.getMessage(response.statusCode);
      throw Exception('Failed to load latest currency rates');
    }
  }

  Future<Map<String, dynamic>> ConvertCurrancyApi(String base_currency, String Currencies) async {

    final response = await http.get(Uri.parse(
        '${apiUrl}?apikey=${apiKey}&currencies=${Currencies}&base_currency=${base_currency}'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      HttpError.getMessage(response.statusCode);
      throw Exception('Failed to load latest currency rates');
    }
  }

  Future<Map<String, dynamic>> fetchHistoricalRateRates(String Date) async {
    final response = await http.get(Uri.parse('$apiUrl?apikey=$apiKey&currencies=AUD&date_from=${Date}T08%3A47%3A25.289Z&date_to=${Date}T08%3A47%3A25.289Z'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      HttpError.getMessage(response.statusCode);
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
    }
    else {
      HttpError.getMessage(response.statusCode);
      throw Exception('Failed to load country flags');
    }
  }
}

