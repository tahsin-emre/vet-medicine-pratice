import 'package:flutter/material.dart';

Widget myWidTF(TextEditingController cont, String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    child: TextField(
      controller: cont,
      decoration: InputDecoration(border: const OutlineInputBorder(), labelText: label),
    ),
  );
}
