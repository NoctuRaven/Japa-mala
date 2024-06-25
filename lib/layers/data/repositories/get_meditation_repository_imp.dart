import 'package:japa_mala/layers/data/datasource/datasource.dart';
import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';
import 'package:japa_mala/layers/domain/repositories/get_meditation_repository.dart';

class GetMeditationRepositoryImp extends GetMeditationRepository {
  final Datasource _datasource;
  GetMeditationRepositoryImp(this._datasource);
  @override
  Future<List<MeditationEntity>> call() async {
    return await _datasource.getMeditationDto();
  }
}
