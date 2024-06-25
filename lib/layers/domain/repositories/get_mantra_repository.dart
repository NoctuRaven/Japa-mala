import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';

abstract class GetMantraRepository {
  Future<List<MantraEntity>> call();
}
