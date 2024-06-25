import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';

abstract class UpdateMantraRepository {
  Future<bool> call(MantraEntity mantra);
}
