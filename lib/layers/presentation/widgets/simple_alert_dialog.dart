// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SimpleAlertDialog extends StatelessWidget {
  final void Function() buttonFunction1;
  final void Function() buttonFunction2;
  final String title;

  const SimpleAlertDialog({
    Key? key,
    required this.buttonFunction1,
    required this.buttonFunction2,
    required this.title,
  }) : super(key: key);

  @override
  AlertDialog build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        ElevatedButton(
          onPressed: buttonFunction1,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              textStyle: const TextStyle(color: Colors.white)),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: buttonFunction2,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              textStyle: const TextStyle(color: Colors.white)),
          child: const Text("OK"),
        ),
      ],
    );
  }
}
