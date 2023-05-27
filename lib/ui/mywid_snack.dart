import 'package:flutter/material.dart';

void showSnack(BuildContext context, String label) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Text(label),
    ),
  );
}
