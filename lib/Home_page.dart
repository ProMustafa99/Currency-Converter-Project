import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:currency_converter/Bloc_state_mangmet/states.dart';
import 'package:currency_converter/CustomDropDown.dart';
import 'package:currency_converter/Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc_state_mangmet/CurrencyBloc.dart';

String SelectedCrruancy ="USD";

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
              condition: listCrrany.length > 0,
              builder: (context) {
                print(listCrrany);

                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Currency Converter'),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: FormKey,

                      child: Column(
                        children: [

                          InputUser(Amount),

                          const SizedBox(
                            height: 40,
                          ),

                          Row(
                            children: [

                              DropDowmmenu(
                                  listCrrany ,
                                  onChanged: (newValue) {
                                     Base_Currency = newValue;
                                  }
                              ),

                              const SizedBox(width: 15),
                              IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.swap_horiz)
                              ),
                              const SizedBox(width: 15),
                              DropDowmmenu(
                                listCrrany,
                                onChanged: (newValue){
                                  To_Currency = newValue;
                                },
                              )
                            ],
                          ) ,

                          const SizedBox(
                            height: 40,
                          ),

                          ElevatedButton(
                            onPressed: () {
                              String text = Amount.text;
                              double value = double.tryParse(text) ?? 0.0;

                              if(FormKey.currentState!.validate()) {
                                Currency.get(context).convertcurrency(Base_Currency, To_Currency, value);
                              }

                            },
                            child: const Text("Convert"),

                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero, // Remove padding to stretch the button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Optional: set border radius
                              ),
                              minimumSize: Size(double.infinity, 48), // Set minimum size to span width and height 48
                            ),

                          ),

                          const SizedBox(
                            height: 40,
                          ),

                          Container(
                              padding: EdgeInsets.all(16.0), // Add margin of 16 pixels to all sides
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child:  Column(
                                children: [
                                  Text('Result:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 20,),
                                  Text("${Currency.get(context).resultconvert}"),
                                ],
                              )
                          ),
                        ],
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
