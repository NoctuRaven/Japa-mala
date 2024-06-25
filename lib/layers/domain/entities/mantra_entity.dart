import 'package:japa_mala/layers/domain/entities/pratice_entity.dart';

class MantraEntity extends PraticeEntity {
  int acumulation;
  int goal;
  String description;
  MantraEntity({
    required this.acumulation,
    required this.goal,
    super.id,
    required super.name,
    required this.description,
  });

  setRepetition(int repeateQt) {
    acumulation = repeateQt;
  }
}
