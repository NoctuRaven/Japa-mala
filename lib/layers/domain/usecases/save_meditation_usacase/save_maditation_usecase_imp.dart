import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';
import 'package:japa_mala/layers/domain/repositories/save_meditation_repository.dart';
import 'package:japa_mala/layers/domain/usecases/save_meditation_usacase/save_meditation_usecase.dart';

class SaveMaditationUseCaseImp implements SaveMeditationUseCase {
  final SaveMeditationRepository _getSaveMeditationRepository;
  SaveMaditationUseCaseImp(this._getSaveMeditationRepository);
  @override
  Future<bool> call(MeditationEntity meditationEntity) async {
    return await _getSaveMeditationRepository(meditationEntity);
  }
}
