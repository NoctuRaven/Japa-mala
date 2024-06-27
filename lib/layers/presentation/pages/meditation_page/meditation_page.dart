import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japa_mala/layers/domain/entities/meditation_entity.dart';
import 'package:japa_mala/layers/presentation/pages/meditation_page/bloc/database_meditation_bloc.dart';
import 'package:japa_mala/layers/presentation/pages/meditation_page/bloc/timer_cubit.dart';
import 'package:japa_mala/layers/presentation/widgets/color_flag_widget.dart';
import 'package:japa_mala/layers/presentation/widgets/meditation_edit_dialog.dart';
import 'package:japa_mala/layers/presentation/widgets/meditation_list_title_widget.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List<MeditationEntity> meditationList =
    //     context.read<DatabaseMeditationCubit>().state;

    void onMeditationListTap(MeditationEntity meditation) {
      context.read<DatabaseMeditationCubit>().onTapList(meditation);
      context.read<DatabaseMeditationCubit>().onGetMeditationList();
      Navigator.pop(context);
    }

    void onDeleteMeditation(MeditationEntity meditation) async {
      await context
          .read<DatabaseMeditationCubit>()
          .onDeleteMeditation(meditation);
    }

    Future<void> dialogBuilder(BuildContext context, AlertDialog dialog) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        },
      );
    }

    return Visibility(
      child: BlocBuilder<DatabaseMeditationCubit, List<MeditationEntity>>(
        builder: (context, state) {
          var timerCubit;
          if (state.isNotEmpty) {
            if (context.read<DatabaseMeditationCubit>().selectedMeditation !=
                null) {
              timerCubit = TimerCubit(
                  context.read<DatabaseMeditationCubit>().selectedMeditation);
            } else {
              timerCubit =
                  TimerCubit(context.read<DatabaseMeditationCubit>().state[0]);
            }
          } else {
            timerCubit = null;
          }
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Column(
                      children: [
                        Text(
                          "Meditation",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  ...state.map(
                    (meditation) {
                      return MeditationListTitleWidget(
                          meditation: meditation,
                          deleteMeditation: onDeleteMeditation,
                          onTap: onMeditationListTap);
                    },
                  ).toList(),
                ],
              ),
            ),
            backgroundColor: Colors.yellow[800],
            appBar: AppBar(
              backgroundColor: Colors.red[900],
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background_1.png"),
                    fit: BoxFit.fill),
              ),
              child: Visibility(
                visible: (timerCubit != null),
                replacement: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: const CircleBorder(),
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.2,
                              MediaQuery.of(context).size.width * 0.2)),
                      onPressed: () {
                        dialogBuilder(
                          context,
                          MeditationEditDialog(
                            buttonFunction1: context
                                .read<DatabaseMeditationCubit>()
                                .onSaveMeditation,
                            meditation: MeditationEntity(
                                name: "", hrs: 0, minutes: 0, seconds: 0),
                          ).build(context),
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    const Text("Add a new timer")
                  ],
                ),
                child: BlocBuilder<TimerCubit, int>(
                  bloc: timerCubit,
                  builder: (context, state) {
                    return Column(
                      children: [
                        const ColorFlagWidget(),
                        Container(
                          height: 450,
                          margin: const EdgeInsets.only(bottom: 20),
                          // padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.yellow[800],
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/timer_border_2.png",
                              ),
                              fit: BoxFit.fill,
                            ),
                            // color: Colors.green,
                            // border: Border.all(),
                            // borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  '${(timerCubit!.remainingTimeInSeconds ~/ 3600).toString().padLeft(2, '0')}:${((timerCubit.remainingTimeInSeconds % 3600) ~/ 60).toString().padLeft(2, '0')}:${(timerCubit.remainingTimeInSeconds % 60).toString().padLeft(2, '0')}',
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  "assets/images/timer_border.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  width:
                                      MediaQuery.of(context).size.height * 0.5,
                                  color: const Color.fromARGB(255, 211, 0, 0),
                                ),
                              ),
                              Positioned.fill(
                                bottom: -100,
                                child: SizedBox(
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        timerCubit.reinitCountdown();
                                      },
                                      icon: const Icon(
                                        Icons.replay,
                                        size: 50,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            timerCubit.startCountdown();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: timerCubit.isRunning
                                ? Colors.yellow
                                : Colors.black,
                          ),
                          child: Icon(
                            timerCubit.isRunning
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: timerCubit.isRunning
                                ? Colors.black
                                : Colors.yellow,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        onPressed: () {
                                          dialogBuilder(
                                            context,
                                            MeditationEditDialog(
                                                    buttonFunction1: context
                                                        .read<
                                                            DatabaseMeditationCubit>()
                                                        .onUpdadeMeditation,
                                                    meditation:
                                                        timerCubit.meditation!)
                                                .build(context),
                                          );
                                        },
                                        child: const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green),
                                      onPressed: () {
                                        dialogBuilder(
                                          context,
                                          MeditationEditDialog(
                                            buttonFunction1: context
                                                .read<DatabaseMeditationCubit>()
                                                .onSaveMeditation,
                                            meditation: MeditationEntity(
                                                name: "",
                                                hrs: 0,
                                                minutes: 0,
                                                seconds: 0),
                                          ).build(context),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
