part of 'add_data_cubit.dart';

@immutable
abstract class AddDataState {}

class AddDataInitial extends AddDataState {}

class AddDataloading extends AddDataState {}

class AddDataloaded extends AddDataState {}

class AddDataErro extends AddDataState {}
