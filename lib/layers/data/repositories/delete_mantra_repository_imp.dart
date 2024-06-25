import 'package:japa_mala/layers/data/datasource/datasource.dart';
import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/domain/repositories/delete_mantra_repository.dart';

class DeleteMantraRepositoryImp implements DeleteMantraRepository {
  final Datasource _datasource;
  DeleteMantraRepositoryImp(this._datasource);
  @override
  Future<bool> call(MantraEntity mantra) async {
    return await _datasource.deleteMantra(mantra);
  }
}
