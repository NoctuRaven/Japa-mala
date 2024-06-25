import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';
import 'package:japa_mala/layers/domain/repositories/get_meditation_repository.dart';
import 'package:japa_mala/layers/domain/usecases/get_meditation_usecase/get_meditation_usecase.dart';

class GetMeditationUsecaseimp implements GetMeditationUsecase {
  final GetMeditationRepository _getMeditationRepository;
  GetMeditationUsecaseimp(this._getMeditationRepository);
  @override
  Future<List<MeditationEntity>> call() async {
    return await _getMeditationRepository();
  }
}
