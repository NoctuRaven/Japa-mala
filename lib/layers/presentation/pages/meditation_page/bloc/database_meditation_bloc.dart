import 'package:bloc/bloc.dart';
import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';
import 'package:japa_mala/layers/domain/usecases/delete_meditation_usecase/delete_meditation_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/get_meditation_usecase/get_meditation_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/save_meditation_usacase/save_meditation_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/update_meditation_usecase/update_meditation_usecase.dart';

class DatabaseMeditationCubit extends Cubit<List<MeditationEntity>> {
  final GetMeditationUsecase getMeditationUsecase;
  final DeleteMeditationUseCase deleteMeditationUsecase;
  final UpdateMeditationUsecase updateMeditationUsecase;
  final SaveMeditationUseCase saveMeditationUseCase;

  DatabaseMeditationCubit({
    required this.getMeditationUsecase,
    required this.deleteMeditationUsecase,
    required this.updateMeditationUsecase,
    required this.saveMeditationUseCase,
  }) : super(<MeditationEntity>[]) {
    onGetMeditationList();
  }

  int onGetMeditationIndex(MeditationEntity meditation) {
    return state.indexOf(meditation);
  }

  onGetMeditationList() async {
    var list = (await getMeditationUsecase.call());
    emit(list);
  }

  onSaveMeditation(MeditationEntity meditation) async {
    await saveMeditationUseCase(meditation);
    onGetMeditationList();
  }

  onUpdadeMeditation(MeditationEntity meditation)async {
    await updateMeditationUsecase(meditation);
    print(meditation.minutes);
    onGetMeditationList();
  }

  onDeleteMeditation(MeditationEntity meditation) async {
    await deleteMeditationUsecase(meditation);
    onGetMeditationList();
  }
}
