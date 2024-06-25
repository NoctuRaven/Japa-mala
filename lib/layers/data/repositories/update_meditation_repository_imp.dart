import 'package:japa_mala/layers/data/datasource/datasource.dart';
import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';
import 'package:japa_mala/layers/domain/repositories/update_meditation_repository.dart';

class UpdateMeditationRepositoryImp implements UpdateMeditationRepository {
  final Datasource _datasource;
  UpdateMeditationRepositoryImp(this._datasource);
  @override
  Future<bool> call(MeditationEntity meditation) async {
    return await _datasource.updateMeditation(meditation);
  }
}
