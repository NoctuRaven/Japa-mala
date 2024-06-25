import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';
import 'package:japa_mala/layers/domain/repositories/delete_meditation_repository.dart';
import 'package:japa_mala/layers/domain/usecases/delete_meditation_usecase/delete_meditation_usecase.dart';

class DeleteMeditationUseCaseImp implements DeleteMeditationUseCase {
  final DeleteMeditationRepository _deleteMeditationRepository;
  DeleteMeditationUseCaseImp(this._deleteMeditationRepository);
  @override
  Future<bool> call(MeditationEntity meditation) async {
    return await _deleteMeditationRepository(meditation);
  }
}
