import 'package:japa_mala/layers/data/datasource/datasource.dart';
import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/domain/repositories/save_mantra_repository.dart';

class SaveMantraRepositoryImp implements SaveMantraRepository {
  final Datasource _datasource;
  SaveMantraRepositoryImp(this._datasource);
  @override
  Future<bool> call(MantraEntity mantra) async {
    return await _datasource.createMantra(mantra);
  }
}
