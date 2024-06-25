import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';

abstract class GetMeditationUsecase {
  Future<List<MeditationEntity>> call();
}
