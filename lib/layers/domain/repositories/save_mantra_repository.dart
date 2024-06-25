import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';

abstract class SaveMantraRepository {
  Future<bool> call(MantraEntity mantra);
}
