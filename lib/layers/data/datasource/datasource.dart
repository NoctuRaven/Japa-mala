import 'package:japa_mala/layers/data/dto/mantra_dto.dart';
import 'package:japa_mala/layers/data/dto/meditation_dto.dart';
import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';

abstract class Datasource {
  // Future<List<PraticeEntity>> getPraticeList();

  Future<List<MeditationDto>> getMeditationDto();
  Future<List<MantraDto>> getMantraDto();

  Future<bool> updateMantra(MantraEntity mantra);
  Future<bool> updateMeditation(MeditationEntity meditation);

  Future<bool> createMantra(MantraEntity mantra);
  Future<bool> createMeditation(MeditationEntity meditation);

  Future<bool> deleteMantra(MantraEntity mantra);
  Future<bool> deleteMeditation(MeditationEntity meditation);
}
