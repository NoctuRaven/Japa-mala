import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';
import 'package:japa_mala/layers/presentation/pages/mantra_page/bloc/database_mantra_cubit.dart';
import 'package:japa_mala/layers/presentation/pages/mantra_page/bloc/japa_mala_cubit.dart';
import 'package:japa_mala/layers/presentation/pages/mantra_page/bloc/on_edit_cubit.dart';
import 'package:japa_mala/layers/presentation/pages/mantra_page/components/mantra_counter_component.dart';
import 'package:japa_mala/layers/presentation/pages/mantra_page/components/mantra_details_component.dart';
import 'package:japa_mala/layers/presentation/widgets/color_flag_widget.dart';
import 'package:japa_mala/layers/presentation/widgets/mantra_list_title_widget.dart';

import 'bloc/bottom_navegation_bloc.dart';
import 'bloc/counter_cubit.dart';

class MantraPage extends StatefulWidget {
  const MantraPage({super.key});

  @override
  State<MantraPage> createState() => _MantraPageState();
}

class _MantraPageState extends State<MantraPage> {
  late ConterCubit counterCubit;
  late BottomNavigationCubit navigationCubit;
  late JapaMalaCubit japaMalaCubit;
  late OnEditCubit onEditCubit;
  int mantraIndex = 0;

  @override
  void initState() {
    counterCubit = ConterCubit();
    navigationCubit = BottomNavigationCubit();
    japaMalaCubit = JapaMalaCubit();
    onEditCubit = OnEditCubit();
    super.initState();
  }

  void pageChange(int index) {
    onEditCubit.onReset();
    navigationCubit.getIndex(index);
  }

  List<NavigationDestination> buildNavigationDestinationItems() {
    return [
      NavigationDestination(
          icon: Image.asset(
            "assets/images/japa_mala.png",
            height: 30,
            color: Colors.black,
          ),
          label: "COUNTER"
          
          ),
      NavigationDestination(
        icon: Image.asset(
          "assets/images/mantra_pages.png",
          height: 30,
          color: Colors.black,
        ),
        label: "MANTRA DETAILS",
      ),
    ];
  }

  static final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSizeH = MediaQuery.of(context).size.height;
    var screenSizeW = MediaQuery.of(context).size.width;
    List<MantraEntity> mantraList = context.watch<DatabaseMantraCubit>().state;

    void onMantaListTap(MantraEntity mantra) {
      mantraIndex = context.read<DatabaseMantraCubit>().getMantraIndex(mantra);
      context.read<DatabaseMantraCubit>().onGetMantraList();
      Navigator.pop(context);
    }

    void onDeleteMantra(MantraEntity mantra) {
      context.read<DatabaseMantraCubit>().onDeleteMantra(mantra);
      if (mantraList.isNotEmpty) mantraIndex = 0;
    }

    return BlocBuilder<BottomNavigationCubit, int>(
      bloc: navigationCubit,
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          bottomNavigationBar: NavigationBar(
            elevation: 20,
            onDestinationSelected: pageChange,
            destinations: buildNavigationDestinationItems(),
            selectedIndex: state,
            backgroundColor: Colors.red[800],

          ),
          backgroundColor: Colors.yellow[800],
          appBar: AppBar(
            title: const Text("Japa-mala"),
            backgroundColor: Colors.red[800],
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.home_filled,color: Colors.black,)),
            ],
          ),
          drawer: Drawer(
            child: BlocBuilder<DatabaseMantraCubit, List<MantraEntity>>(
              builder: (context, state) {
                return ListView(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.red[800],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Mantras',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: screenSizeH * 0.1,
                            child: Image.asset(
                              "assets/images/om.png",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...state.map((mantra) {
                      return MantraListTitleWidget(
                        mantra: mantra,
                        deleteMantra: onDeleteMantra,
                        onTap: onMantaListTap,
                      );
                    }).toList(),
                  ],
                );
              },
            ),
          ),
          body: BlocBuilder<DatabaseMantraCubit, List<MantraEntity>>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background_1.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    const ColorFlagWidget(),
                    state.isEmpty
                        ? ElevatedButton(
                            onPressed: () {},
                            child: const Text("Create a new mantra"))
                        : [
                            // Mantra counter
                            MantraCounterComponent(
                              screenSizeH: screenSizeH,
                              screenSizeW: screenSizeW,
                              japaMalaCubit: japaMalaCubit,
                              conterCubit: counterCubit,
                              mantra: state[mantraIndex],
                              databaseMantraCubit:
                                  context.watch<DatabaseMantraCubit>(),
                            ),

                            //MantraDetails

                            MantraDetailsComponent(
                              databaseMantraCubit:
                                  context.watch<DatabaseMantraCubit>(),
                              onEditCubit: onEditCubit,
                              form: form,
                              mantra: state[mantraIndex],
                            )
                          ][navigationCubit.state],
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
