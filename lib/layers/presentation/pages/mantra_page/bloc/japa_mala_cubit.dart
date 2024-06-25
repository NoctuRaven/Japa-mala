import 'package:flutter_bloc/flutter_bloc.dart';

class JapaMalaCubit extends Cubit<int> {
  JapaMalaCubit() : super(0);

  bool increment(int limite) {
    int value = state + 1;
    if (value >= limite) {
      clean();
      return false;
    } else {
      emit(value);
      return true;
    }
  }

  clean() {
    emit(0);
  }
}
