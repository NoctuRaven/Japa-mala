import 'package:flutter_bloc/flutter_bloc.dart';

class SetTimeDropdownCubit extends Cubit<List<int>> {
  SetTimeDropdownCubit() : super([0, 0, 0]);

  settingState(int h,m,s){
  emit([h,m,s]);
  }

  setHrs(int hrs) {
    emit([hrs, state[1], state[2]]);
  }

  setMinutes(int minutes) {
    emit([state[0], minutes, state[2]]);
  }

  setSeconds(int seconds) {
    emit([state[0], state[1], seconds]);
  }
}
