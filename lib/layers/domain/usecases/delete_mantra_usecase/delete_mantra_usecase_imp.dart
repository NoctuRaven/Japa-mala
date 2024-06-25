import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/domain/repositories/delete_mantra_repository.dart';
import 'package:japa_mala/layers/domain/usecases/delete_mantra_usecase/delete_mantra_usecase.dart';

class DeleteMantraUseCaseImp implements DeleteMantraUsecase {
  final DeleteMantraRepository _deleteMantraRepository;
  DeleteMantraUseCaseImp(this._deleteMantraRepository);
  @override
  Future<bool> call(MantraEntity mantra) async {
    return await _deleteMantraRepository(mantra);
  }
}
