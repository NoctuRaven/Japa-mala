import 'package:japa_mala/layers/data/datasource/datasource.dart';
import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';
import 'package:japa_mala/layers/domain/repositories/save_meditation_repository.dart';

class SaveMeditationRepositoryImp implements SaveMeditationRepository {
  final Datasource _datasource;
  SaveMeditationRepositoryImp(this._datasource);
  @override
  Future<bool> call(MeditationEntity meditation) async {
    return await _datasource.createMeditation(meditation);
  }
}
