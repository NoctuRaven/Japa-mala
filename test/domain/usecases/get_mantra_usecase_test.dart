import 'package:japa_mala/layers/data/datasource/datasource.dart';
import 'package:japa_mala/layers/data/datasource/local/local_datasource_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:japa_mala/layers/data/repositories/get_mantra_repository_imp.dart';
import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/domain/repositories/get_mantra_repository.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late GetMantraRepository sut;
  late Datasource datasource;
  setUp(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    datasource = LocalDatasourceImp();
    sut = GetMantraRepositoryImp(datasource);
  });
  test('Should return a mantra list', () async {
    var result = await sut.call();

    expect(result, isInstanceOf<List<MantraEntity>>());
  });
}
