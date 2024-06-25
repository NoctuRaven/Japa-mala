import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';

abstract class SaveMantraUseCase {
  Future<bool> call(MantraEntity mantraEntity);
}
