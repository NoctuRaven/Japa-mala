import 'package:japa_mala/layers/data/datasource/datasource.dart';
import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';
import 'package:japa_mala/layers/domain/repositories/delete_meditation_repository.dart';

class DeleteMeditationRepositoryImp implements DeleteMeditationRepository {
  final Datasource _datasource;
  DeleteMeditationRepositoryImp(this._datasource);
  @override
  Future<bool> call(MeditationEntity meditation) async {
    return await _datasource.deleteMeditation(meditation);
  }
}
