import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';

abstract class SaveMeditationUseCase {
  Future<bool> call(MeditationEntity meditationEntity);
}
