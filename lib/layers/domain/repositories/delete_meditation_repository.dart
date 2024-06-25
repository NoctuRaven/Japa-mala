import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';

abstract class DeleteMeditationRepository {
  Future<bool> call(MeditationEntity meditation);
}
