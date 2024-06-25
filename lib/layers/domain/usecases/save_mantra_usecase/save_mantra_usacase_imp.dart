import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/domain/repositories/save_mantra_repository.dart';
import 'package:japa_mala/layers/domain/usecases/save_mantra_usecase/save_mantra_usecase.dart';

class SaveMantraUseCaseImp implements SaveMantraUseCase {
  final SaveMantraRepository _getSaveMantraRepository;
  SaveMantraUseCaseImp(this._getSaveMantraRepository);
  @override
  Future<bool> call(MantraEntity mantraEntity) async {
    return await _getSaveMantraRepository(mantraEntity);
  }
}
