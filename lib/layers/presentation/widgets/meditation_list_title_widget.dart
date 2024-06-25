import 'package:flutter/material.dart';
import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';

class MeditationListTitleWidget extends StatelessWidget {
  final MeditationEntity meditation;
  final dynamic Function(MeditationEntity meditation) deleteMeditation;
  final void Function(MeditationEntity) onTap;
  const MeditationListTitleWidget(
      {required this.meditation,
      required this.deleteMeditation,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => onTap(meditation),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: const Icon(
                Icons.circle,
                color: Colors.black,
              ),
              title: Text("${(meditation.hrs).toString().padLeft(2, '0')}:${(meditation.minutes).toString().padLeft(2, '0')}:${(meditation.seconds).toString().padLeft(2, '0')}"),
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 15,
          child: IconButton(
            onPressed: () => deleteMeditation(meditation),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
