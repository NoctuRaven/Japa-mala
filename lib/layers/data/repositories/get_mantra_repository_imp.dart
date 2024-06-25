import 'package:japa_mala/layers/data/datasource/datasource.dart';
import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/domain/repositories/get_mantra_repository.dart';

class GetMantraRepositoryImp implements GetMantraRepository {
  final Datasource _datasource;
  GetMantraRepositoryImp(this._datasource);
  @override
  Future<List<MantraEntity>> call() async {
    return await _datasource.getMantraDto();
  }
}
