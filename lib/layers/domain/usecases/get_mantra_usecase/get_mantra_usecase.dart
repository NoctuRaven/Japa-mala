import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';

abstract class GetMantraUsecase {
  Future<List<MantraEntity>> call();
}
