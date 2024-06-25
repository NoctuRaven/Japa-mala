import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';

class MeditationDto extends MeditationEntity {
  MeditationDto(
      {required super.id,
      required super.name,
      required super.hrs,
      required super.minutes,
      required super.seconds,
      
   });

  Map<String, dynamic> toMap(Map map) {
    return {
      "id": super.id,
      "name": super.name,
      "hrs": super.hrs,
      "minutes": super.minutes,
      "seconds": super.seconds,
 
    };
  }

  static MeditationDto fromMap(Map map) {
    return MeditationDto(
      id: map["id"],
      name: map["name"],
      hrs: map["hrs"],
      minutes: map["minutes"],
      seconds: map["seconds"],
      

    );
  }
}
