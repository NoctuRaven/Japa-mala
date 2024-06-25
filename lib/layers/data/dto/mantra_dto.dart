import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';

class MantraDto extends MantraEntity {
  MantraDto(
      {required super.id,
      required super.name,
      required super.goal,
      required super.acumulation,
      required super.description});

  Map<String, dynamic> toMap() {
    return {
      "id": super.id,
      "name": super.name,
      "goal": super.goal,
      "acumulation": super.acumulation,
      "description": super.description
    };
  }

  static MantraDto fromMap(Map map) {
    return MantraDto(
        id: map['id'],
        goal: map['goal'] ?? 0,
        name: map['name'],
        acumulation: map['acumulation'],
        description: map['description']);
  }
}
