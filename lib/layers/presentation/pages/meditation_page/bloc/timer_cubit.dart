import 'package:bloc/bloc.dart';
import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';

class TimerCubit extends Cubit<int> {
  MeditationEntity? meditation;
  bool isRunning = false;
  bool shouldReinit = false;
  int _selectedHours = 0;
  int _selectedMinutes = 0;
  int _selectedSeconds = 0;
  int remainingTimeInSeconds = 0;
  int timeInSeconds = 0;

  TimerCubit(this.meditation) : super(0) {
    if(meditation!=null){
  _selectedHours = meditation!.hrs;
  _selectedMinutes = meditation!.minutes;
  _selectedSeconds = meditation!.seconds;
    }
  timeInSeconds =  _selectedHours * 3600 + _selectedMinutes * 60 + _selectedSeconds;
  remainingTimeInSeconds = timeInSeconds;
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

  void reinitCountdown(){
    shouldReinit = true;
  }

  void _updateCountdown() async {
    if (isRunning && !shouldReinit && remainingTimeInSeconds > 0) {
      Future.delayed(const Duration(seconds: 1), () {
          remainingTimeInSeconds--;
          emit(remainingTimeInSeconds);
        _updateCountdown();
      }).whenComplete((){
        if(shouldReinit){
           pauseCountdown();
           shouldReinit = false;
           remainingTimeInSeconds = timeInSeconds;
           emit(remainingTimeInSeconds);
        }
      });
    } else {
      pauseCountdown();
    }
  }
}
