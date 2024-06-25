import 'package:bloc/bloc.dart';
import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';

class TimerCubit extends Cubit<int> {
  MeditationEntity meditation;
  bool isRunning = false;
  int _selectedHours = 0;
  int _selectedMinutes = 0;
  int _selectedSeconds = 0;
  int remainingTimeInSeconds = 0;

  TimerCubit(this.meditation) : super(0) {
  _selectedHours = meditation.hrs;
  _selectedMinutes = meditation.minutes;
  _selectedSeconds = meditation.seconds;
  remainingTimeInSeconds =
          _selectedHours * 3600 + _selectedMinutes * 60 + _selectedSeconds;
  }

  void startCountdown() {
      isRunning = !isRunning;
      // remainingTimeInSeconds =
      //     _selectedHours * 3600 + _selectedMinutes * 60 + _selectedSeconds;
    _updateCountdown();
  }



  void pauseCountdown() {
      isRunning = false;
      emit(remainingTimeInSeconds);
  }

  void _updateCountdown() {
    if (isRunning && remainingTimeInSeconds > 0) {
      Future.delayed(Duration(seconds: 1), () {
          remainingTimeInSeconds--;
          emit(remainingTimeInSeconds);
        _updateCountdown();
      });
    } else {
      pauseCountdown();
    }
  }
}
