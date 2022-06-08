
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());

  void dataPass(name,email){
    if(name=="Nidhi"){
      emit(DataSucc(name, email));
    }else{
      emit(DataFailure("Failure"));
    }
  }
}
