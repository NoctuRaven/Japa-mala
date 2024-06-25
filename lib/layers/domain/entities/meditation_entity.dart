// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:japa_mala/layers/domain/entities/pratice_entity.dart';

class MeditationEntity extends PraticeEntity {
  int hrs;
  int minutes;
  int seconds;


  MeditationEntity({
    super.id,
    required super.name,
    required this.hrs,
    required this.minutes,
    required this.seconds,

  });

  setTime({String? name, int hrs = 0, int minutes = 0, int seconds = 0}) {
    name != null ? (this.name = name) : null;
    this.hrs = hrs;
    this.minutes = minutes;
    this.seconds = seconds;
  }

  MeditationEntity copyWith({
    int? hrs,
    int? minutes,
    int? seconds,
    String? description, 
  }) {

    return MeditationEntity( 
      id: id,
      name: name,
      hrs: hrs ?? this.hrs,
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,

    );
  }
}
