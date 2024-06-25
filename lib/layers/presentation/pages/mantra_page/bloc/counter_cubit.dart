import 'package:flutter_bloc/flutter_bloc.dart';

class ConterCubit extends Cubit<int> {
  ConterCubit() : super(0);

  increment() {
    var value = state;
    setValue(value + 1);
  }

  decrement() {
    var value = state;
    setValue(value > 0 ? value - 1 : 0);
  }

  setValue(int newValue) {
    emit(newValue);
  }
}
