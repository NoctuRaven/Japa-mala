// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/presentation/pages/mantra_page/bloc/database_mantra_cubit.dart';
import 'package:japa_mala/layers/presentation/pages/mantra_page/bloc/japa_mala_cubit.dart';
import 'package:japa_mala/layers/presentation/widgets/simple_alert_dialog.dart';

import '../bloc/counter_cubit.dart';

class MantraCounterComponent extends StatelessWidget {
  final double screenSizeH;
  final double screenSizeW;
  final JapaMalaCubit japaMalaCubit;
  final ConterCubit conterCubit;
  final DatabaseMantraCubit databaseMantraCubit;
  final MantraEntity mantra;

  MantraCounterComponent({
    Key? key,
    required this.screenSizeH,
    required this.screenSizeW,
    required this.japaMalaCubit,
    required this.conterCubit,
    required this.mantra,
    required this.databaseMantraCubit,
  }) : super(key: key);

  Future<void> dialogBuilder(BuildContext context, AlertDialog dialog) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  void onCounterLimit() {
    mantra.acumulation += mantra.goal;
    databaseMantraCubit.onUpdateMantra(mantra);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          mantra.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        // Number of repetion
        Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.centerLeft,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: screenSizeH * 0.15,
                  width: screenSizeW * 0.5,
                  child: Stack(
                    children: [
                      Center(
                        child: BlocBuilder<JapaMalaCubit, int>(
                          bloc: japaMalaCubit,
                          builder: (context, state) {
                            return Text(
                              state == 0 ? "ZERO" : state.toString(),
                              style: const TextStyle(
                                fontSize: 70,
                                color: Colors.black
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        // left: 0.1,
                        child: SizedBox(
                          width: screenSizeW * 0.5,
                          child: Image.asset(
                            "assets/images/decorative_line.png",
                            color: Colors.black,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      japaMalaCubit.clean();
                    },
                    icon: const Icon(
                      Icons.replay,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black,
                        ),
                        child: Text(
                          mantra.goal.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          dialogBuilder(
                              context,
                              SimpleAlertDialog(
                                title:
                                    "Do you wish to add ${mantra.goal} to mantra acumulation ?",
                                buttonFunction1: () =>
                                    Navigator.of(context).pop(),
                                buttonFunction2: () {
                                  onCounterLimit();
                                  japaMalaCubit.clean();
                                  Navigator.of(context).pop();
                                },
                              ).build(context));
                        },
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                            backgroundColor: Colors.red[800],
                            shape: const CircleBorder(),
                            fixedSize: const Size(80, 80)),
                        child: const Text(
                          "FINISH",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                            overflow: TextOverflow.clip
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // Image
        InkWell(
          onTap: () {
            japaMalaCubit.increment(mantra.goal) ? null : onCounterLimit();
          },
          child: Container(
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(width: 5),
                shape: BoxShape.circle,
                color: Colors.yellow[800]),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/tap_area_two.png",
                  color: Colors.black,
                ),
                Positioned(
                  right: 90,
                  bottom: 80,
                  child: SizedBox(
                    height: screenSizeH * 0.25,
                    child: Image.asset(
                      "assets/images/mala-japonesa.png",
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
