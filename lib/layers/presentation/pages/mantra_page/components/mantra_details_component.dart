// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japa_mala/layers/shared/validators.dart';

import '../../../../domain/entities/mantra_entity.dart';
import '../bloc/database_mantra_cubit.dart';
import '../bloc/on_edit_cubit.dart';

class MantraDetailsComponent extends StatelessWidget {
  final OnEditCubit onEditCubit;
  final DatabaseMantraCubit databaseMantraCubit;
  final GlobalKey<FormState> form;
  final MantraEntity mantra;

  MantraDetailsComponent({
    Key? key,
    required this.onEditCubit,
    required this.form,
    required this.mantra,
    required this.databaseMantraCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Validators validator = Validators();
    return BlocBuilder<OnEditCubit, bool>(
      bloc: onEditCubit,
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                state
                    ? ElevatedButton(
                        onPressed: () {
                          onEditCubit.onEdit();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),

                        child: const Text("Edit", style: TextStyle(color: Colors.white),),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              onEditCubit.onEdit();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text("cancel", style: TextStyle(color: Colors.white),),
                          ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     onEditCubit.onEdit();
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //       backgroundColor: Colors.blue),
                          //   child: const Text("Create new mantra"),
                          // ),
                          ElevatedButton(
                            onPressed: () {
                              if (form.currentState!.validate()) {
                                form.currentState!.save();
                                databaseMantraCubit.onUpdateMantra(mantra);
                                onEditCubit.onEdit();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            child: const Text("Save",style: TextStyle(color: Colors.white),),
                          ),
                        ],
                      ),
                Container(
                  color: Colors.yellow[800],
                  height: MediaQuery.of(context).size.height * 0.65,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          // margin: const EdgeInsets.all(25),
                          child: Image.asset(
                            "assets/images/mantra_border.png",
                            fit: BoxFit.fill,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 50, horizontal: 80),
                          child: Form(
                            key: form,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Visibility(
                                      visible: state,
                                      replacement: TextFormField(
                                        initialValue: mantra.name,
                                        validator:
                                            validator.nameMantraValidator,
                                        onSaved: (newValue) {
                                          mantra.name = newValue!;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Mantra name",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                        ),
                                      ),
                                      child: Text(mantra.name),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          // height: MediaQuery.of(context)
                                          //         .size
                                          //         .height *
                                          //     0.2,
                                          // width: MediaQuery.of(context)
                                          //         .size
                                          //         .width *
                                          //     0.4,
                                          // padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              // borderRadius:
                                              //     BorderRadius.circular(15.0),
                                              // border: Border.all(width: 2),
                                              ),
                                          child: Visibility(
                                            visible: state,
                                            replacement: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  width: 150,
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText: "Counter",
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                    ),
                                                    initialValue:
                                                        mantra.goal.toString(),
                                                    validator: validator
                                                        .counterMantraValidator,
                                                    onSaved: (newValue) {
                                                      mantra.goal =
                                                          int.tryParse(
                                                              newValue!)!;
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  width: 150,
                                                  child: TextFormField(
                                                   keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                    
                                                      labelText: "Acumulation",
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                    ),
                                                    initialValue: mantra
                                                        .acumulation
                                                        .toString(),
                                                    validator: validator
                                                        .counterMantraValidator,
                                                    onSaved: (newValue) {
                                                      mantra.acumulation =
                                                          int.tryParse(
                                                              newValue!)!;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text("Counter:${mantra.goal}"),
                                                Text(
                                                    "Acumulation:${mantra.acumulation}"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Visibility(
                                  visible: state,
                                  replacement: TextFormField(
                                    maxLines: 3,
                                    initialValue:
                                        mantra.description.toString(),
                                    onSaved: (newValue) {
                                      mantra.description = newValue ?? "";
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Description",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      child: Text(mantra.description),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        );
      },
    );
  }
}
