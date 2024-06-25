import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';

abstract class GetMeditationRepository {
  Future<List<MeditationEntity>> call();
}
