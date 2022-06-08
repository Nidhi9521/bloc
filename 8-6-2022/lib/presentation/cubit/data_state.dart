part of 'data_cubit.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class DataSucc extends DataState{
  var name,email;
  DataSucc(this.name,this.email);
}

class DataFailure extends DataState{
  var msg;
  DataFailure(this.msg);
}