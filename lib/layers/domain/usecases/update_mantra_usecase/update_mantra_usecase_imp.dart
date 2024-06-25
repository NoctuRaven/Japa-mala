import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/domain/repositories/update_mantra_repository.dart';
import 'package:japa_mala/layers/domain/usecases/update_mantra_usecase/update_mantra_usecase.dart';

class UpdateMantraUsecaseImp implements UpdateMantraUsecase {
  final UpdateMantraRepository _getUpdateMantraRepository;
  UpdateMantraUsecaseImp(this._getUpdateMantraRepository);
  @override
  Future<bool> call(MantraEntity mantra) async {
    return await _getUpdateMantraRepository(mantra);
  }
}
