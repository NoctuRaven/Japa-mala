import 'package:japa_mala/layers/data/datasource/datasource.dart';
import 'package:japa_mala/layers/data/datasource/local/sqflite_repository.dart';
import 'package:japa_mala/layers/data/dto/meditation_dto.dart';
import 'package:japa_mala/layers/data/dto/mantra_dto.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/entities/mantra_entity.dart';
import '../../../domain/entities/meditation_entity.dart';

class LocalDatasourceImp implements Datasource {
  late Database db;

  @override
  Future<List<MantraDto>> getMantraDto() async {
    db = await SQFliteRepository.instance.database;
    List<Map<String, dynamic>> records = await db.query('Mantra');
    List<MantraDto> mantraList =
        records.map((e) => MantraDto.fromMap(e)).toList();
    return mantraList;
  }

  @override
  Future<List<MeditationDto>> getMeditationDto() async {
    db = await SQFliteRepository.instance.database;
    List<Map<String, dynamic>> records = await db.query('Meditation');
    List<MeditationDto> meditationList =
        records.map((e) => MeditationDto.fromMap(e)).toList();
    return meditationList;
  }

  @override
  Future<bool> createMantra(MantraEntity mantra) async {
    db = await SQFliteRepository.instance.database;
    try {
      db.insert(
        'Mantra',
        {
          'name': mantra.name,
          'acumulation': mantra.acumulation,
          'goal': mantra.goal,
          'description': mantra.description,
        },
      );
    } on Error {
      return false;
    }
    return true;
  }

  @override
  Future<bool> createMeditation(MeditationEntity meditation) async {
    db = await SQFliteRepository.instance.database;
    try {
      db.insert(
        'Meditation',
        {
          'name': meditation.name,
          'hrs': meditation.hrs,
          'minutes': meditation.minutes,
          'seconds': meditation.seconds,
        },
      );
    } on Error {
      return false;
    }
    return true;
  }

  @override
  Future<bool> deleteMantra(MantraEntity mantra) async {
    db = await SQFliteRepository.instance.database;
    try {
      db.delete(
        'Mantra',
        where: 'id = ?',
        whereArgs: [mantra.id],
      );
    } on Error {
      return false;
    }
    return true;
  }

  @override
  Future<bool> deleteMeditation(MeditationEntity meditation) async {
    db = await SQFliteRepository.instance.database;

    try {
      db.delete(
        'Meditation',
        where: 'id = ?',
        whereArgs: [meditation.id],
      );
    } on Error {
      return false;
    }
    return true;
  }

  @override
  Future<bool> updateMantra(MantraEntity mantra) async {
    db = await SQFliteRepository.instance.database;
    try {
      db.update(
          'Mantra',
          {
            'name': mantra.name,
            'acumulation': mantra.acumulation,
            'goal': mantra.goal,
            'description': mantra.description,
          },
          where: 'id = ?',
          whereArgs: [mantra.id]);
    } on Error {
      return false;
    }
    return true;
  }

  @override
  Future<bool> updateMeditation(MeditationEntity meditation) async {
    db = await SQFliteRepository.instance.database;

    try {
      db.update(
          'Meditation',
          {
            'name': meditation.name,
            'hrs': meditation.hrs,
            'minutes': meditation.minutes,
            'seconds': meditation.seconds,
          },
          where: 'id = ?',
          whereArgs: [meditation.id]);
    } on Error {
      return false;
    }
    return true;
  }
}
