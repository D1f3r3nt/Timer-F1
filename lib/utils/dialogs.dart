import 'package:flutter/material.dart';

AlertDialog sureDialog({ required void Function() confirm, required BuildContext context }) {
  return AlertDialog(
    title: const Center(child: Text('Fin')),
    content: const Center(child: Text('Quieres finalizar la carrera?')),
    actions: [
      TextButton(onPressed: confirm, child: const Text('Si')),
      TextButton(onPressed: () => Navigator.pop(context), child: const Text('No')),
    ],
  );
}