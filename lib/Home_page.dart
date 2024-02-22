import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:currency_converter/Bloc_state_mangmet/states.dart';
import 'package:currency_converter/CustomDropDown.dart';
import 'package:currency_converter/Global/Widget/Widget.dart';
import 'package:currency_converter/Style/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc_state_mangmet/CurrencyBloc.dart';
import 'Global/Variable/variable.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController Amount = TextEditingController();

    return BlocProvider(
        create: (context) => Currency(InitialState())..fetchData(),
        child: BlocConsumer<Currency, StatesApp>(
          listener: (context, state) {},
          builder: (context, state) {
            return ConditionalBuilder(
              condition: listCrrany.isNotEmpty,
              builder: (context) {

                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Currency Converter'),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: FormKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            InputUser(Amount),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              child:  Row(
                                children: [
                                  Expanded(child: 
                                  DropDownMenu(
                                      listCrrany ,
                                      onChanged: (newValue) {
                                        Base_Currency = newValue;
                                      }
                                  ),
                                  ),
                                  const SizedBox(width: 15),
                                  IconButton(
                                      onPressed: (){

                                      },
                                      icon: const Icon(Icons.swap_horiz)
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: DropDownMenu(
                                      listCrrany,
                                      onChanged: (newValue){
                                        To_Currency = newValue;
                                      },
                                    ),
                                  )
                                ],
                              ) ,
                            ),

                            const SizedBox(height: 40,),

                            ElevatedButton(
                              onPressed: () {
                                String text = Amount.text;
                                double value = double.tryParse(text) ?? 0.0;
                                if(FormKey.currentState!.validate()) {
                                  Currency.get(context).convertcurrency(Base_Currency, To_Currency, value);
                                }
                              },

                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero, // Remove padding to stretch the button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Optional: set border radius
                                ),
                                minimumSize: const Size(double.infinity, 48), // Set minimum size to span width and height 48
                              ),
                              child: const Text("Convert"),

                            ),

                            const SizedBox(
                              height: 40,
                            ),

                            Container(
                                padding: const EdgeInsets.all(10.0), // Add margin of 16 pixels to all sides
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child:  Column(
                                  children: [
                                    const Text('Result:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 20,),
                                    Text("${Currency.get(context).resultconvert}"),
                                  ],
                                )
                            ),

                            const SizedBox(
                              height: 40,
                            ),

                            Container(
                                padding: const EdgeInsets.all(16.0), // Add margin of 16 pixels to all sides
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(
                                  children: [

                                    const Text("Historical From USD TO AUD",style: AppTextStyles.titleTextStyle,),
                                    Text("Date ${last7Days.first}" ,style: AppTextStyles.bodyTextStyle,),
                                    Text('Value $HistoricalRate',style: AppTextStyles.bodyTextStyle,)
                                  ],
                                )
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              fallback: (context) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
            );
          },
        ));
  }
}
