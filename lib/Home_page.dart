import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:currency_converter/Bloc_state_mangmet/bloc_class.dart';
import 'package:currency_converter/Bloc_state_mangmet/states.dart';
import 'package:currency_converter/CustomDropDown.dart';
import 'package:currency_converter/Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  Widget build(BuildContext context) {

    TextEditingController controller =TextEditingController();

    List <String> items=[];
    return   BlocProvider(
        create: (context)=>CreateData(InitialState())..fetchData(),

        child: BlocConsumer<CreateData , StatesApp> (
          listener: (context , state)  {

          },
          builder : (context , state) {
            return  ConditionalBuilder(
              condition: listCrrany.length >0 ,
              builder: (context) {

                listCrrany.forEach((element) {
                  items.add(element['CodeCurrency']);
                });

                print(items);
                return Scaffold(
                  appBar: AppBar(title: const Text('Currency Converter'),),
                  body: Container(
                    child: Column(
                      children: [

                        InputUser(controller),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded (
                                child:  CustomDropdown<String>(
                                  items:items,
                                  onChanged: (value) {
                                    print('Selected: $value');
                                  },
                                ),

                              ),

                             const  SizedBox(width:20 ,),

                              IconButton(
                                  onPressed: () {},
                                  icon:Icon(Icons.swap_horiz)),

                             const SizedBox(width:20 ,),
                              Expanded (
                                child:  CustomDropdown<String>(
                                  items:items,
                                  onChanged: (value) {
                                    print('Selected: $value');
                                  },
                                ),

                              ),

                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 60)),
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: Colors.blue, width: 2),
                                ),
                              ),
                            ),
                            child: const Text('Converter', style: TextStyle(color: Colors.blue, fontSize: 20)),
                          ),
                        ),
                      ],
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
          } ,
        )
    );
  }
}

