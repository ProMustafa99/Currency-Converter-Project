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
                  backgroundColor: mainColor,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0 ,vertical: 90.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                              width: 200,
                              child: Text("Currency Convert",style:AppTextStyles.header ,)
                          ),
                          const SizedBox(height: 40,),
                          Form(
                            key: FormKey,
                            child: Column(
                              children: [
                                InputUser(Amount),
                                const SizedBox(height: 40,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: DropDownMenu(
                                          listCrrany ,
                                          onChanged: (newValue) {
                                            Base_Currency = newValue;
                                          }
                                      ),
                                    ),
                                    const SizedBox(width: 40,),
                                    Expanded(
                                      child: DropDownMenu(
                                      listCrrany,
                                      onChanged: (newValue){
                                        To_Currency = newValue;
                                      },
                                    ),
                            
                                    )
                            
                                  ],
                                ),
                                const SizedBox(height: 40,),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                  ),
                            
                                  child:  Column (
                                    children: [
                                      const Text("Result" , style:AppTextStyles.titleTextStyle,),
                                      const SizedBox(height: 20,),
                                      Text("${Currency.get(context).resultconvert}",style: AppTextStyles.bodyTextStyle,),
                                    ],
                                  ),
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
                                    minimumSize: const Size(double.infinity, 48),
                                    backgroundColor: Colors.white,
                                  ),
                                  child: const Text("Convert",style: AppTextStyles.bodyTextStyle,),

                                ),
                              ],
                            ),
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
