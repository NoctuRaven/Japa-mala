import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/domain/repositories/get_mantra_repository.dart';
import 'package:japa_mala/layers/domain/usecases/get_mantra_usecase/get_mantra_usecase.dart';

class GetMantraUsecaseImp implements GetMantraUsecase {
  final GetMantraRepository _getMantraRepository;
  GetMantraUsecaseImp(this._getMantraRepository);
  @override
  Future<List<MantraEntity>> call() async {
    return await _getMantraRepository();
  }
}
