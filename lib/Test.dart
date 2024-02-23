import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_converter/API/api.dart';
import 'package:currency_converter/Error/Error.dart';
import 'package:currency_converter/Shared_Preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

List <String> flage =[];

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {



  Future<void> fetchData() async {

    final currencyApi = CurrencyApi(
      apiUrl: 'https://api.freecurrencyapi.com/v1/latest',
      apiKey: 'fca_live_rKuggFlZGYXHB4LPf3Xd1uGFfdpc1brmnqelV37P',
    );

    Map CurrencyInfo = await currencyApi.fetchLatestRates();
    CurrencyInfo['data'].forEach((key, value) {
      flage.add(key.toString().toLowerCase().substring(0 ,2 ));
    });

    print(flage);
  }

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: flage.length,
        itemBuilder:(context , index) {
          print(flage[index]);
          return Container(
            child:Center(
              child: CachedNetworkImage(
                imageUrl: "https://flagcdn.com/16x12/${flage[index]}.png",

              ),
            ),
          );

        },
      ),
    );
  }
}
