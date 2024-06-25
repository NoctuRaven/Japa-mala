import 'package:flutter_bloc/flutter_bloc.dart';

class ChoosePraticeButtomCubit extends Cubit<bool> {
  ChoosePraticeButtomCubit() : super(true);

  void onMantraTap() {
    emit(true);
  }

  void onMeditationTap() {
    emit(false);
  }
}
