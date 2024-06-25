import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japa_mala/layers/domain/entities/mantra_entity.dart';


import 'package:japa_mala/layers/presentation/pages/mantra_page/bloc/database_mantra_cubit.dart';
import 'package:japa_mala/layers/presentation/widgets/simple_alert_dialog.dart';
import 'package:japa_mala/layers/shared/validators.dart';


class AddNewPraticePage extends StatefulWidget {
  const AddNewPraticePage({super.key});

  @override
  State<AddNewPraticePage> createState() => _AddNewPraticePageState();
}

class _AddNewPraticePageState extends State<AddNewPraticePage> {
  final GlobalKey<FormState> _formMantra = GlobalKey<FormState>();
  


  MantraEntity mantra = MantraEntity(
      acumulation: 0,
      goal: 0,
      name: "MMMM",
      description: "MMMM");


  Future<void> dialogBuilder(BuildContext context, AlertDialog dialog) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.red[900],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.home_filled,color: Colors.black,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 5,
              width: double.maxFinite,
              color: Colors.white,
            ),
            Container(
              height: 5,
              width: double.maxFinite,
              color: Colors.blue,
            ),
            Container(
              height: 5,
              width: double.maxFinite,
              color: Colors.green[800],
            ),
        
Container(
  margin: EdgeInsets.all(20.0),
  padding: EdgeInsets.all(20.0),
  decoration: BoxDecoration(
    color: Colors.yellow,
    border: Border.all(),
    borderRadius: BorderRadius.circular(20)
  ),
  child: Column(
                          children: [
                            Form(
                              key: _formMantra,
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: Validators().nameMantraValidator,
                                    onSaved: (newValue) {
                                      mantra.name = newValue!;
                                    },
                                    decoration: const InputDecoration(
                                      label: Text("Mantra name"),
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator:
                                        Validators().counterMantraValidator,
                                    onSaved: (newValue) {
                                      mantra.goal =
                                          int.tryParse(newValue!.trim())!;
                                    },
                                    decoration: const InputDecoration(
                                      label: Text("Repetitions number "),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const Text("Description"),
                                  TextFormField(
                                    textAlign: TextAlign.justify,
                                    maxLines: 7,
                                    onSaved: (newValue) {
                                      mantra.description = newValue!;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
),
            ElevatedButton(
                onPressed: () {
       
                    if (_formMantra.currentState!.validate()) {
                      _formMantra.currentState!.save();
                      dialogBuilder(
                        context,
                        SimpleAlertDialog(
                            title: "Do you want to save this mantra ? ",
                            buttonFunction1: () {
                              Navigator.of(context).pop();
                            },
                            buttonFunction2: () {
                              context
                                  .read<DatabaseMantraCubit>()
                                  .onSaveMantra(mantra);
                              Navigator.of(context).pop();
                            }).build(context),
                      );
                    }
                  
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                    shape: const CircleBorder(),
                    fixedSize: const Size(70, 70),
                    backgroundColor: Colors.green),
                child: const Text("Save",style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
