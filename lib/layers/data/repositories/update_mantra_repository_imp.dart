import 'package:japa_mala/layers/data/datasource/datasource.dart';
import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/domain/repositories/update_mantra_repository.dart';

class UpdateMantraRepositoryImp implements UpdateMantraRepository {
  final Datasource _datasource;
  UpdateMantraRepositoryImp(this._datasource);
  @override
  Future<bool> call(MantraEntity mantra) async {
    return await _datasource.updateMantra(mantra);
  }
}
