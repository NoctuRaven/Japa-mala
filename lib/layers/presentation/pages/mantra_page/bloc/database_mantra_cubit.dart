import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/domain/usecases/delete_mantra_usecase/delete_mantra_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/get_mantra_usecase/get_mantra_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/save_mantra_usecase/save_mantra_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/update_mantra_usecase/update_mantra_usecase.dart';

class DatabaseMantraCubit extends Cubit<List<MantraEntity>> {
  final GetMantraUsecase getMantraUsecase;
  final DeleteMantraUsecase deleteMantraUsecase;
  final UpdateMantraUsecase updateMantraUsecase;
  final SaveMantraUseCase saveMantraUseCase;
  DatabaseMantraCubit({
    required this.getMantraUsecase,
    required this.updateMantraUsecase,
    required this.deleteMantraUsecase,
    required this.saveMantraUseCase,
  }) : super(<MantraEntity>[]) {
    onGetMantraList();
  }

  onSaveMantra(MantraEntity mantra) {
    saveMantraUseCase.call(mantra);
    onGetMantraList();
  }

  onDeleteMantra(MantraEntity mantra) {
    deleteMantraUsecase.call(mantra);
    onGetMantraList();
  }

  onUpdateMantra(MantraEntity mantra) {
    updateMantraUsecase.call(mantra);
    onGetMantraList();
  }

  int getMantraIndex(MantraEntity mantra) {
    return state.indexOf(mantra);
  }

  onGetMantraList() async {
    var list = (await getMantraUsecase.call());
    emit(list);
  }
}
