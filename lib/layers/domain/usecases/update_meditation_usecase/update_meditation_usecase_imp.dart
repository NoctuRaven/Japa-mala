import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';

import 'package:japa_mala/layers/domain/usecases/update_meditation_usecase/update_meditation_usecase.dart';

import '../../repositories/update_meditation_repository.dart';

class UpdateMeditationUsecaseImp implements UpdateMeditationUsecase {
  final UpdateMeditationRepository _getUpdateMeditationRepository;
  UpdateMeditationUsecaseImp(this._getUpdateMeditationRepository);
  @override
  Future<bool> call(MeditationEntity meditation) async {
    return await _getUpdateMeditationRepository(meditation);
  }
}
