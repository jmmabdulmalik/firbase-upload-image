import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../firebase_adddata.dart';

part 'add_data_state.dart';

class AddDataCubit extends Cubit<AddDataState> {
  AddDataCubit() : super(AddDataInitial());

  addData(
      {required String name,
      required String email,
      required String pass,
      required String img}) {
    try {
      emit(AddDataloading());
      print('loading Emit');
      final data = FirebaseAddData.addData(
          name: name, email: email, pass: pass, img: img);
      emit(AddDataloaded());
      print('Loaded Emit');
    } catch (e) {
      emit(AddDataErro());
      print(e.toString());
    }
  }
}
