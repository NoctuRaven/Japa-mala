import 'package:flutter/material.dart';
import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';

class MantraListTitleWidget extends StatelessWidget {
  final MantraEntity mantra;
  final dynamic Function(MantraEntity mantra) deleteMantra;
  final void Function(MantraEntity) onTap;
  const MantraListTitleWidget(
      {required this.mantra,
      required this.deleteMantra,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => onTap(mantra),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: const Icon(
                Icons.circle,
                color: Colors.black,
              ),
              title: Text(mantra.name),
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 15,
          child: IconButton(
            onPressed: () => deleteMantra(mantra),
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
