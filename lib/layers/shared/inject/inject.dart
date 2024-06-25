import 'package:get_it/get_it.dart';
import 'package:japa_mala/layers/data/datasource/datasource.dart';
import 'package:japa_mala/layers/data/datasource/local/local_datasource_imp.dart';
import 'package:japa_mala/layers/data/repositories/delete_mantra_repository_imp.dart';
import 'package:japa_mala/layers/data/repositories/delete_meditation_repository_imp.dart';
import 'package:japa_mala/layers/data/repositories/get_mantra_repository_imp.dart';
import 'package:japa_mala/layers/data/repositories/get_meditation_repository_imp.dart';
import 'package:japa_mala/layers/data/repositories/save_mantra_repository_imp.dart';
import 'package:japa_mala/layers/data/repositories/save_meditation_repository_imp.dart';
import 'package:japa_mala/layers/data/repositories/update_mantra_repository_imp.dart';
import 'package:japa_mala/layers/data/repositories/update_meditation_repository_imp.dart';
import 'package:japa_mala/layers/domain/repositories/delete_mantra_repository.dart';
import 'package:japa_mala/layers/domain/repositories/delete_meditation_repository.dart';
import 'package:japa_mala/layers/domain/repositories/get_mantra_repository.dart';
import 'package:japa_mala/layers/domain/repositories/get_meditation_repository.dart';
import 'package:japa_mala/layers/domain/repositories/save_mantra_repository.dart';
import 'package:japa_mala/layers/domain/repositories/save_meditation_repository.dart';
import 'package:japa_mala/layers/domain/repositories/update_mantra_repository.dart';
import 'package:japa_mala/layers/domain/repositories/update_meditation_repository.dart';
import 'package:japa_mala/layers/domain/usecases/delete_mantra_usecase/delete_mantra_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/delete_mantra_usecase/delete_mantra_usecase_imp.dart';
import 'package:japa_mala/layers/domain/usecases/delete_meditation_usecase/delete_meditation_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/delete_meditation_usecase/delete_meditation_usecase_imp.dart';
import 'package:japa_mala/layers/domain/usecases/get_mantra_usecase/get_mantra_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/get_mantra_usecase/get_mantra_usecase_imp.dart';
import 'package:japa_mala/layers/domain/usecases/get_meditation_usecase/get_meditation_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/get_meditation_usecase/get_meditation_usecase_imp.dart';
import 'package:japa_mala/layers/domain/usecases/save_mantra_usecase/save_mantra_usacase_imp.dart';
import 'package:japa_mala/layers/domain/usecases/save_mantra_usecase/save_mantra_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/save_meditation_usacase/save_meditation_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/update_mantra_usecase/update_mantra_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/update_mantra_usecase/update_mantra_usecase_imp.dart';
import 'package:japa_mala/layers/domain/usecases/update_meditation_usecase/update_meditation_usecase.dart';
import 'package:japa_mala/layers/domain/usecases/update_meditation_usecase/update_meditation_usecase_imp.dart';
import 'package:japa_mala/layers/presentation/pages/mantra_page/bloc/database_mantra_cubit.dart';
import 'package:japa_mala/layers/presentation/pages/meditation_page/bloc/database_meditation_bloc.dart';

import '../../domain/usecases/save_meditation_usacase/save_maditation_usecase_imp.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<Datasource>(() => LocalDatasourceImp());

    //repositories
    getIt.registerLazySingleton<DeleteMantraRepository>(
        () => DeleteMantraRepositoryImp(getIt()));
    getIt.registerLazySingleton<DeleteMeditationRepository>(
        () => DeleteMeditationRepositoryImp(getIt()));
    getIt.registerLazySingleton<SaveMantraRepository>(
        () => SaveMantraRepositoryImp(getIt()));
    getIt.registerLazySingleton<SaveMeditationRepository>(
        () => SaveMeditationRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetMantraRepository>(
        () => GetMantraRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetMeditationRepository>(
        () => GetMeditationRepositoryImp(getIt()));
    getIt.registerLazySingleton<UpdateMantraRepository>(
        () => UpdateMantraRepositoryImp(getIt()));
    getIt.registerLazySingleton<UpdateMeditationRepository>(
        () => UpdateMeditationRepositoryImp(getIt()));

    //usecases

    getIt.registerLazySingleton<DeleteMantraUsecase>(
        () => DeleteMantraUseCaseImp(getIt()));
    getIt.registerLazySingleton<DeleteMeditationUseCase>(
        () => DeleteMeditationUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetMantraUsecase>(
        () => GetMantraUsecaseImp(getIt()));
    getIt.registerLazySingleton<GetMeditationUsecase>(
        () => GetMeditationUsecaseimp(getIt()));
    getIt.registerLazySingleton<SaveMantraUseCase>(
        () => SaveMantraUseCaseImp(getIt()));
    getIt.registerLazySingleton<SaveMeditationUseCase>(
        () => SaveMaditationUseCaseImp(getIt()));
    getIt.registerLazySingleton<UpdateMantraUsecase>(
        () => UpdateMantraUsecaseImp(getIt()));
    getIt.registerLazySingleton<UpdateMeditationUsecase>(
        () => UpdateMeditationUsecaseImp(getIt()));

    //bloc
    getIt.registerFactory<DatabaseMantraCubit>(() => DatabaseMantraCubit(
        getMantraUsecase: getIt(),
        updateMantraUsecase: getIt(),
        deleteMantraUsecase: getIt(),
        saveMantraUseCase: getIt()));

    getIt.registerFactory<DatabaseMeditationCubit>(
      () => DatabaseMeditationCubit(
        saveMeditationUseCase: getIt(),
        getMeditationUsecase: getIt(),
        deleteMeditationUsecase: getIt(),
        updateMeditationUsecase: getIt(),
      ),
    );
  }
}
