import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';

abstract class UpdateMeditationRepository {
  Future<bool> call(MeditationEntity meditation);
}
