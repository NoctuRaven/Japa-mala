import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';
import 'package:japa_mala/layers/presentation/pages/meditation_page/bloc/set_time_dropdownbuttom_cubit.dart';

class MeditationEditDialog extends StatelessWidget {
  final void Function(MeditationEntity) buttonFunction1;
  final MeditationEntity meditation;

  const MeditationEditDialog(
      {Key? key, required this.buttonFunction1, required this.meditation})
      : super(key: key);

  @override
  AlertDialog build(BuildContext context) {
    var dropdownCubit = SetTimeDropdownCubit();
    dropdownCubit.settingState(
        meditation.hrs, meditation.minutes, meditation.seconds);
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      title:meditation.id !=null ? Text("Edit"): Text("Add"),
      content: BlocBuilder<SetTimeDropdownCubit, List>(
        bloc: dropdownCubit,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<int>(
                value: state[0],
                onChanged: (value) {
                  dropdownCubit.setHrs(value ?? 0);
                },
                items: List.generate(24, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(
                      '$index hours',
                      style: TextStyle(fontSize: 12),
                    ),
                  );
                }),
              ),
              SizedBox(width: 10),
              DropdownButton<int>(
                value: state[1],
                onChanged: (value) {
                  dropdownCubit.setMinutes(value ?? 0);
                },
                items: List.generate(60, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child:
                        Text('$index minutes', style: TextStyle(fontSize: 12)),
                  );
                }),
              ),
              SizedBox(width: 10),
              DropdownButton<int>(
                value: state[2],
                onChanged: (value) {
                  dropdownCubit.setSeconds(value ?? 0);
                },
                items: List.generate(60, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child:
                        Text('$index seconds', style: TextStyle(fontSize: 12)),
                  );
                }),
              ),
            ],
          );
        },
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              buttonFunction1(
                meditation.copyWith(
                  hrs: dropdownCubit.state[0],
                  minutes: dropdownCubit.state[1],
                  seconds: dropdownCubit.state[2],
                ),
              );
              Navigator.of(context).pop();
            },
            child: Text("ok")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"))
      ],
    );
  }
}
