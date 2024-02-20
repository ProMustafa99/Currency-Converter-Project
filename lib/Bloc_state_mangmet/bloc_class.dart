import 'package:currency_converter/API/api.dart';
import 'package:currency_converter/Bloc_state_mangmet/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CreateData  extends Cubit<StatesApp> {

  CreateData(super.initialState);
  static CreateData get(context) =>BlocProvider.of(context);
  final DataFetcher datafetcher =DataFetcher();

  void fetchData() {
    datafetcher.fetchData();
  }

}



