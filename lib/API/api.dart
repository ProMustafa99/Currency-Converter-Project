import 'dart:convert';
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

