import 'package:flutter_bloc/flutter_bloc.dart';

class OnEditCubit extends Cubit<bool> {
  OnEditCubit() : super(true);

  onEdit() {
    emit(!state);
  }

  onReset() {
    emit(true);
  }
}
