import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:japa_mala/layers/presentation/pages/mantra_page/bloc/database_mantra_cubit.dart';
import 'package:japa_mala/layers/presentation/pages/meditation_page/bloc/database_meditation_bloc.dart';
import 'package:japa_mala/layers/shared/inject/inject.dart';
import 'layers/presentation/pages/home_page/home_page.dart';

void main() {
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DatabaseMantraCubit>(
          create: (BuildContext context) => GetIt.I.get<DatabaseMantraCubit>(),
        ),
        BlocProvider<DatabaseMeditationCubit>(
          create: (BuildContext context) =>
              GetIt.I.get<DatabaseMeditationCubit>(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
